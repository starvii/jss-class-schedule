import base64
import uuid
import os
import time
import threading
import json
import queue

# python3 connect mysql with [PyMySQL] or [CyMySQL]
try:
    import cymysql as mysql
except:
    import pymysql as mysql

# const
TINY_INT = -128, 127, 1
TINY_UINT = 0, 255, 1
SMALL_INT = -32768, 32767, 2
SMALL_UINT = 0, 65535, 2
MEDIUM_INT = -8388608, 8388607, 3
MEDIUM_UINT = 0, 16777215, 3
INT = -2147483648, 2147483647, 4
UINT = 0, 4294967295, 4
BIG_INT = -9223372036854775808, 9223372036854775807, 8
BIG_UINT = 0, 18446744073709551615, 8


# varibles for <gen_object_id>
object_id_time_stamp = 0
object_id_inc = 0
object_id_lock = threading.Lock()

def _int2bytes(data, length):
    bl = [(data >> (8 * i)) & 0xFF for i in range(length)][::-1]
    b = bytes(bl)
    return b

# same as MONGODB ObjectID (big in byteorader)
# 00 01 02 03    04 05 06    07 08    09 10 11
# timestamp      mac         pid      inc

def gen_object_id(integer = False, inc_mac = True, inc_pid = True):
    global time_stamp_int
    global object_id_inc
    ts = int(time.time())
    # lock variable
    object_id_lock.acquire()
    if object_id_time_stamp == ts:
        object_id_inc += 1
    else:
        object_id_time_stamp = ts
        object_id_inc = 0
    object_id_lock.release()
    # integer to bytes
    t = _int2bytes(ts, 4)
    # not compatible of python2
    bl = [t]
    if inc_mac:
        mac = uuid.getnode()
        m = _int2bytes(mac, 3)
        bl.append(m)
    if inc_pid:
        pid = os.getpid()
        p = _int2bytes(pid, 2)
        bl.append(p)
    n = _int2bytes(object_id_inc, 3)
    bl.append(n)
    b = b''.join(bl)
    # return int or base64string
    if integer:
        return int.from_bytes(b, 'big')
    else:
        pk = base64.b64encode(b)
        pk = pk.replace(b'/', b'_').replace(b'+', b'-').replace(b'=', b'')
        return pk.decode('utf-8')

# varibles for <gen_simple_bigint_pk>
pk_time_stamp = 0
pk_inc = 0
pk_lock = threading.Lock()

def gen_simple_bigint_pk():
    global time_stamp_int
    global pk_inc
    ts = int(time.time())
    # lock variable
    pk_lock.acquire()
    if time_stamp_int == ts:
        pk_inc += 1
    else:
        time_stamp_int = ts
        pk_inc = 0
    pk_lock.release()
    # integer to bytes
    t = _int2bytes(ts, 4)
    mac = uuid.getnode()
    m = _int2bytes(mac, 3)
    m = bytes([m[0] ^ m[1], m[2]])
    n = _int2bytes(pk_inc, 2)
    b = m + t + n
    return int.from_bytes(b, 'big')

class PartitionIntIdGenerator(object):
    '''
    @param table_name:
    数据库表名
    @param read_conf_func:
    读取配置函数
    @param write_conf_func:
    写入配置函数
    @param synchronize_pk_func:
    同步主键函数
    '''
    def __init__(self, table_name, read_conf_func = default_read_conf_func, \
                 write_conf_func = default_write_conf_func, \
                 synchronize_pk_func = default_synchronize_pk_func):
        self._conf_name = table_name + '.txt'
        self._read = read_conf_func
        self._write = write_conf_func
        self._synchronize = synchronize_pk_func
        self._conf = self._read(self._conf_name)
        self._pc = self._conf['partition_count']
        self._pks = self._conf['pks']
        self._synchronize(self._conf_name, self._pks)

        self._q = queue.Queue(self._pc)
    # TODO: 其他功能
def default_read_conf_func(conf_name):
    try:
        with open(conf_name, 'r') as f:
            conf = json.load(f)
    except:
        conf = _init_conf()
    return conf

def _init_conf(int_range = UINT, partition_count = 10):
    mn, mx = int_range[0], int_range[1]
    d = (mx - mn) // partition_count
    idx = [(mn + i * d, mn + (i + 1) * d -1) for i in range(partition_count)]
    idx[-1] = (idx[-1][0], mx)
    pidx = [(e[0], e) for e in idx]
    return {'partition_count': partition_count, 'pks': pidx}

def default_write_conf_func(conf_name, conf):
    with open(conf_name, 'w') as f:
        json.dump(conf, f)

def default_synchronize_pk_func(table_name, pks):
    pass