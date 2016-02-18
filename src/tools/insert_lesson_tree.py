from util.db_util import gen_object_id
from entity.course import Lesson
import random

from sqlalchemy.orm import sessionmaker
from dao import engine

# 类型：0未定义，1科目，2章节，3课程，4实验，5见习，6其他

if __name__ == '__main__':
    with open('course.txt', 'r', encoding = 'utf-8') as f:
        lns = f.readlines()
    # (0                 1   2    3     4    5     6     7          )
    # (level(tab count), id, pid, path, num, name, type, lesson_time)
    array = []
    pnodes = [] # 模拟栈
    for l in lns:
        name = l.strip()
        if l[0] != '\t':
            # 此处 dbid 暂时当作 level 来使用。真正写入数据库时需要置为None
            root = Lesson(dbid = 0, id = gen_object_id(), pid = '', path = '', \
                          num = '', name = name, lesson_type = 1, \
                          lesson_time = 0)
            array.append(root)
#             pnodes.append(root)
            num = 1
            continue
        if len(name) == 0: continue
        level = len(l) - len(l.lstrip())
        oid = gen_object_id()
        lesson_type = 0 # 默认情况为未定义
        lesson_time = 0
        if level > array[-1].dbid: # 进入子列
            # 将上一个对象加入父节点栈
            pn = array[-1]
            pn.lesson_type = 2 if pn != root else 1 
            # 如果被加入父节点栈，则说明具有子节点。
            # 所以该节点类型为章节（除根节点外）
            pnodes.append(pn)
            num = pnodes[-1].num + '.1'
        elif level == array[-1].dbid: # 同级别
            # 生成 num
            ns = array[-1].num.split('.')
            n = str(int(ns[-1]) + 1)
            num = '.'.join(ns[:-1]) + '.' + n
        else: # 退回上一级别
            # 上一个父节点出栈
            ns = pnodes.pop().num.split('.')
            n = str(int(ns[-1]) + 1)
            num = '.'.join(ns[:-1]) + '.' + n
        if num.startswith('.'): num = num[1:]
        pid = pnodes[-1].id
        path = (pnodes[-1].path + '/' if len(pnodes[-1].path) != 0 else '') + pid
        node = Lesson(dbid = level, id = oid, pid = pid, \
                      path = path, num = num, name = name, lesson_type = 0, \
                      lesson_time = lesson_time)
        array.append(node)
    
    
    # 对类型与课时进行更新，dbid设为none，为写入数据库做准备
    # 所有叶节点类型为课程，增加课时数
    for e in array:
        if e.lesson_type == 0:
            e.lesson_type = 3
            e.lesson_time = random.choice((2, 3))
        e.dbid = None
        e.id = bytes(e.id, 'utf8')
        e.pid = bytes(e.pid, 'utf8')
        e.path = bytes(e.path, 'utf8')
        e.cmt = ''
        e.available = 1
    print(array)

    root.metadata.create_all(engine)

    Session = sessionmaker(bind=engine)
    session = Session()
    session.add_all(array)
    session.commit()