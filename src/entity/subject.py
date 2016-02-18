from core.abstract.node import NodeWithNonOrderedChildren
from core.abstract.node import NodeWithOrderedChildren

class Course(NodeWithNonOrderedChildren):
    ''' One course contains non-ordered charts.
    But it is recommemd that to array charts in the order. '''
    def __init__(self):
        pass

class Chart(NodeWithOrderedChildren):
    ''' One chart contains ordered lessons. '''
    def __init__(self):
        pass

class Lesson(object):
    def __init__(self):
        self.__lesson_name = ''
        self.__teacher = ''
        self.__lesson_time = 0

    def get_lesson_name(self):
        return self.__lesson_name


    def get_teacher(self):
        return self.__teacher


    def get_lesson_time(self):
        return self.__lesson_time


    def set_lesson_name(self, value):
        self.__lesson_name = value


    def set_teacher(self, value):
        self.__teacher = value


    def set_lesson_time(self, value):
        self.__lesson_time = value


    def del_lesson_name(self):
        del self.__lesson_name


    def del_teacher(self):
        del self.__teacher


    def del_lesson_time(self):
        del self.__lesson_time

    lesson_name = property(get_lesson_name, set_lesson_name, del_lesson_name, "lesson_name's docstring")
    teacher = property(get_teacher, set_teacher, del_teacher, "teacher's docstring")
    lesson_time = property(get_lesson_time, set_lesson_time, del_lesson_time, "lesson_time's docstring")
