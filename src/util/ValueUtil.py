numSet = set(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])

def delNonNumeric(string):
    a = [c for c in string]
    a = filter(lambda x: x in numSet, a)
    return ''.join(a)