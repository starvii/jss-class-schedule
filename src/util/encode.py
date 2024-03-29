'''
据说能将 alchemy 对象转换为 json
'''
import json
import datetime
from sqlalchemy.ext.declarative import DeclarativeMeta

def new_alchemy_encoder(revisit_self = False, fields_to_expand = []):
    _visited_objs = []
    class AlchemyEncoder(json.JSONEncoder):
        def default(self, obj):
            if isinstance(obj.__class__, DeclarativeMeta):
                # don't re-visit self
                if revisit_self:
                    if obj in _visited_objs:
                        return None
                    _visited_objs.append(obj)

                # go through each field in this SQLalchemy class
                fields = {}
                for field in [x for x in dir(obj) if not x.startswith('_') and x != 'metadata']:
                    val = obj.__getattribute__(field)

                    # is this field another SQLalchemy object, or a list of SQLalchemy objects?
                    if isinstance(val.__class__, DeclarativeMeta) or (isinstance(val, list) and len(val) > 0 and isinstance(val[0].__class__, DeclarativeMeta)):
                        # unless we're expanding this field, stop here
                        if field not in fields_to_expand:
                            # not expanding this field: set it to None and continue
                            fields[field] = None
                            continue

                    fields[field] = val
                # a json-encodable dict
                return fields
            if isinstance(obj, datetime.datetime):
                return datetime.datetime.strftime(obj, '%Y-%m-%d %H:%M:%S.%f')
            if isinstance(obj, bytes):
                return obj.decode("utf-8")
            return json.JSONEncoder.default(self, obj)
    return AlchemyEncoder

def json_string(obj):
    ret = json.dumps(obj, cls = new_alchemy_encoder(), ensure_ascii=False, indent=2)
    return ret
