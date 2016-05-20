from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from util.log import default_logger as log

__engine = None

def engine():
    global __engine
    if __engine:
        return __engine
    USER = 'db_schedule'
    PASSWORD = 'db_schedule'
    HOST = '10.0.0.20'
    PORT = 3306
    DBNAME = 'db_schedule'
    # mysql://uid:pwd@localhost/mydb?charset=utf8
    url = r'{user}:{password}@{host}:{port}/{dbname}?charset=utf8' \
        .format(user = USER, password = PASSWORD, host = HOST, \
                port = PORT, dbname = DBNAME)
    
    try:
        protocol = 'mysql://'
        full_url = protocol + url
        __engine = create_engine(full_url, encoding="utf-8", echo=True)
    except Exception as e:
        log.debug(e)
        try:
            protocol = 'mysql+cymysql://'
            full_url = protocol + url
            __engine = create_engine(full_url, encoding="utf-8", echo=True)
        except Exception as e:
            log.debug(e)
            protocol = 'mysql+pymysql://'
            full_url = protocol + url
            __engine = create_engine(full_url, encoding="utf-8", echo=True)
    log.debug(full_url)
    return __engine

def session():
    Session = sessionmaker(bind = engine())
    __session = Session()
    return __session