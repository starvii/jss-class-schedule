import base64
import uuid
import os
import time
import threading

time_stamp_int = 0
time_stamp_inc = 0
lock = threading.Lock()

def __int2bytes(data, length):
    bl = [(data >> (8 * i)) & 0xFF for i in range(length)][::-1]
    b = bytes(bl)
    return b

# same as MONGODB ObjectID (big in byteorader)
# 00 01 02 03    04 05 06    07 08    09 10 11
# timestamp      mac         pid      inc

def gen_pk(integer = True, inc_mac = True, inc_pid = True):
    global time_stamp_int
    global time_stamp_inc
    ts = int(time.time())
    # lock variable
    lock.acquire()
    if time_stamp_int == ts:
        time_stamp_inc += 1
    else:
        time_stamp_int = ts
        time_stamp_inc = 0
    lock.release()
    # integer to bytes
    t = __int2bytes(ts, 4)
    
    # not compatible of python2
    bl = [t]
    if inc_mac:
        mac = uuid.getnode()
        m = __int2bytes(mac, 3)
        bl.append(m)
    if inc_pid:
        pid = os.getpid()
        p = __int2bytes(pid, 2)
        bl.append(p)
    n = __int2bytes(time_stamp_inc, 3)
    bl.append(n)
    b = b''.join(bl)
    # return int or base64string
    if integer:
        return int.from_bytes(b, 'big')
    else:
        pk = base64.b64encode(b)
        pk = pk.replace(b'/', b'_').replace(b'+', b'-').replace(b'=', b'')
        return pk.decode('utf-8')