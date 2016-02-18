from sqlalchemy import create_engine
from util.log_util import default_logger as log

USER = 'db_schedule'
PASSWORD = 'db_schedule'
HOST = '10.0.0.20'
PORT = 3306
DBNAME = 'db_schedule'

url = r'{user}:{password}@{host}:{port}/{dbname}' \
    .format(user = USER, password = PASSWORD, host = HOST, \
            port = PORT, dbname = DBNAME)

try:
    protocol = 'mysql://'
    full_url = protocol + url
    engine = create_engine(full_url, echo=True)
except Exception as e:
    try:
        protocol = 'mysql+cymysql://'
        full_url = protocol + url
        engine = create_engine(full_url, echo=True)
    except Exception as e:
        protocol = 'mysql+pymysql://'
        full_url = protocol + url
        engine = create_engine(full_url, echo=True)
log.debug(full_url)