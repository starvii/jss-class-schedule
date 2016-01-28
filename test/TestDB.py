try:
    import cymysql as mysql
except:
    import pymysql as mysql
# import pymysql as mysql

def read_tree(tid):
    conn = mysql.connect(host = '10.0.0.20', port = 3306, \
                         user = 'db_schedule', passwd = 'db_schedule', \
                         db = 'db_schedule', charset='utf8')
    sql = \
'''
SELECT `id`, `pid`, `num`, `name`, `type`, `lesson_time`, `cmt`, `available`, `createtime`, `updatetime`
FROM `lesson_trees` t
WHERE t.`available` = 1
AND t.`id` = %(id)s
'''
    sqlp = \
'''
SELECT `id`, `pid`, `num`, `name`, `type`, `lesson_time`, `cmt`, `available`, `createtime`, `updatetime`
FROM `lesson_trees` t
WHERE t.`available` = 1
AND t.`pid` = %(pid)s
'''
    cur = conn.cursor()
    cur.execute(sql, {'id': tid})
    r = cur.fetchall()
    for e in r: print(e)
    q = [r[0][0]]
    while len(q) > 0:
        pid = q.pop().decode('utf8')
        cur.execute(sqlp, {'pid': pid})
        r = cur.fetchall()
        if len(r) > 0:
            for e in r: 
                print(e)
                q.insert(0, e[0])
    cur.close()
    conn.close()

def test():
    read_tree('C101')

if __name__ == '__main__':
    test()