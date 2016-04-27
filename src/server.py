import tornado.ioloop
import tornado.options
import tornado.httpserver

from util.log import default_logger as log
from app import app

from tornado.options import define, options
define('port', default=80, help='run on th given port', type=int)

def main():
    tornado.options.parse_command_line()
    http_server = tornado.httpserver.HTTPServer(app)
    http_server.listen(options.port)
    log.info('Development server is running at http://127.0.0.1:%s/' % options.port)
    log.info('Quit the server with Control-C')
    tornado.ioloop.IOLoop.instance().start()

if __name__ == '__main__':
    main()
