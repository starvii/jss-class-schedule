class Course(object):

    def __init__(self):
        pass


class Lesson(object):
    def __init__(self):
        self.__teacher_name = ''
        self.__teacher_number = ''

    def get_teacher_name(self):
        return self.__teacher_name

    def get_teacher_number(self):
        return self.__teacher_number

    def set_teacher_name(self, value):
        self.__teacher_name = value

    def set_teacher_number(self, value):
        self.__teacher_number = value

    teacher_name = property(get_teacher_name, set_teacher_name, None, None)
    teacher_number = property(get_teacher_number, set_teacher_number, None, None)

class OrderedLessons(object):
    def __init__(self):
        pass

class NonOrderedLessons(object):
    def __init__(self):
        pass