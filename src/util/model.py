from sqlalchemy.orm.attributes import InstrumentedAttribute
from sqlalchemy.ext.declarative import DeclarativeMeta
from util.encode import json_string
from util.log import default_logger as log

'''
    从 model 类型中，查找被 doc 描述的字段
    将所有符合条件的字段名称 以集合方式返回
'''
# todo 添加缓存
def _find_field(model_type, field_desc):
    fieldset = set();
    for k in model_type.__dict__.keys():
        v = model_type.__dict__[k]
        if isinstance(v, InstrumentedAttribute):
            if field_desc is None:
                fieldset.add(k)
            else:
                if isinstance(v.__doc__, str) and v.__doc__ == field_desc:
                    fieldset.add(k)
                    continue
                if isinstance(v.__doc__, tuple) and field_desc in v.__doc__:
                    fieldset.add(k)
    return fieldset;

'''
    将 model 对象中指定的字段的值，映射至一个 dict
'''
def _map_field(model_obj, field_set):
    values = {}
    for f in field_set:
        values[f] = model_obj.__dict__[f]
    return values

'''
    直接将 model 转为 json
    支持 model 与 list[model] 两种类型
'''
def to_json(model, field_desc):
    if isinstance(model.__class__, DeclarativeMeta):
        model_type = type(model)
        field_set = _find_field(model_type, field_desc)
        value = _map_field(model, field_set)
        return json_string(value)
    elif isinstance(model, list):
        ret = []
        for m in model:
            print(type(m))
            if isinstance(m.__class__, DeclarativeMeta):
                model_type = type(m)
                field_set = _find_field(model_type, field_desc)
                value = _map_field(m, field_set)
                ret.append(value)
            else:
                ret.append(m)
        return json_string(ret)
    else:
        try:
            return json_string(model)
        except Exception as e:
            log.error(e)
            return str(model)
