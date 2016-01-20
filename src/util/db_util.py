import base64
import uuid
import os
import time
import threading
import struct
import math

time_stamp_int = 0
time_stamp_inc = 0
lock = threading.Lock()
b64set = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', \
'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', \
'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', \
'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', \
'7', '8', '9', '0', '-', '_')

def gen_uuid_pk(integer = True):
    n = ~uuid.getnode() % 0x1000000
    pk = uuid.uuid1(n).bytes
    if integer:
        return int.from_bytes(pk, 'little')
    pk = base64.b64encode(pk)
    pk = pk[::-1].replace(b'/', b'_').replace(b'+', b'-').replace(b'=', b'')
    return pk.decode('utf-8')

# same as MONGODB ObjectID (big in byteorader)
# 00 01 02 03    04 05 06    07 08    09 10 11
# timestamp      mac         pid      inc

def gen_pk(byte = False):
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
    if byte:
        return idbyte
    else:
        return int.from_bytes(idbyte, 'big')

def b64encode(idata):
    l = int(math.log(idata) / math.log(64)) + 1
    m = [b64set[(idata >> (i * 6)) & 0x3F] for i in range(l)][::-1]
    s = ''.join(m)
    return s