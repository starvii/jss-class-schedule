from tornado.web import URLSpec
from tornado.web import StaticFileHandler
import module.teacher.url
import module.core.url
import os

STATIC_PATH = os.path.join(os.path.dirname(__file__), "static")

static_handler = URLSpec(r'/(.*)', StaticFileHandler, {'path' : STATIC_PATH, 'default_filename': 'index.html'})

url = []
url.extend(module.core.url.url)
url.extend(module.teacher.url.url)
url.append(static_handler)
