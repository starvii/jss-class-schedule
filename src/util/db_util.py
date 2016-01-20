import base64
import uuid
import os
import time
import threading
import struct

time_stamp_int = 0
time_stamp_inc = 0
lock = threading.Lock()

# same as MONGODB ObjectID (big in byteorader)
# 00 01 02 03    04 05 06    07 08    09 10 11
# timestamp      mac         pid      inc

def gen_pk(integer = True):
    global time_stamp_int
    global time_stamp_inc
    pid = os.getpid()
    ts = int(time.time())
    mac = uuid.getnode()
    
    lock.acquire()
    if time_stamp_int == ts:
        time_stamp_inc += 1
    else:
        time_stamp_int = ts
        time_stamp_inc = 0
    lock.release()
    
    m = [(mac >> (8 * i)) & 0xFF for i in range(3)][::-1]
    n = [(time_stamp_inc >> (8 * i)) & 0xFF for i in range(3)][::-1]
    idbyte = struct.pack('>LBBBHBBB', ts, m[0], m[1], m[2], \
                     pid, n[0], n[1], n[2])
    if integer:
        return int.from_bytes(idbyte, 'big')
    else:
        idstr = base64.b64encode(idbyte)
        idstr = idstr.replace(b'/', b'_').replace(b'+', b'-').replace(b'=', b'')
        return idstr.decode('utf-8')