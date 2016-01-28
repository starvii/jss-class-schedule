import base64
import uuid
import os
import time
import threading

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

def gen_object_id(id_type = 'b64'):
    '''
    @param id_type: 
    id_type has 5 types:
        'i' for int
        'h' for hex
        'H' for hex starts with 0x
        'b' for bytes
        'b64' for base64
    '''
    global object_id_time_stamp
    global object_id_inc
    ts = int(time.time())
    mac = uuid.getnode()
    pid = os.getpid()
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
    m = _int2bytes(mac, 3)
    p = _int2bytes(pid, 2)
    n = _int2bytes(object_id_inc, 3)
    b = b''.join([t, m, p, n])
    # return int or base64string
    idt = id_type.upper()
    if idt == 'I':
        return int.from_bytes(b, 'big')
    elif idt == 'H':
        hl = ['{:02X}'.format(c) for c in b]
        h = ''.join(hl)
        if id_type == 'h': return h
        else: return '0x' + h
    elif idt == 'B':
        return b
    elif idt == 'B64':
        pk = base64.b64encode(b)
        pk = pk.replace(b'/', b'_').replace(b'+', b'-').replace(b'=', b'')
        return pk.decode('utf-8')
    else:
        raise NotImplementedError()

gpk = gen_object_id