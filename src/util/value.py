num_set = set(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])

def del_non_numeric(string):
    a = [c for c in string]
    a = filter(lambda x: x in num_set, a)
    return ''.join(a)

def str2hex(string):
    if None == string or len(string) == 0: return ''
    hl = ['{:02X}'.format(ord(c)) for c in string]
    h = ''.join(hl)
    return h