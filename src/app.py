#!/usr/bin/python3
# -*- coding: utf8 -*-

from url import url
import tornado.web

setting = dict(
#     template_path=os.path.join(os.path.dirname(__file__), "template"),
#     static_path=STATIC_PATH,
    debug=True,
    )

app = tornado.web.Application(
    handlers=url,
    **setting
    )
