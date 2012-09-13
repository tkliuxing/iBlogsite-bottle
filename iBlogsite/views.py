#-*- coding: utf-8 -*-
import os
import bottle
from bottle import Bottle, route
from bottle_renderer import RendererPlugin


def dict_to_nt(idict):
    from collections import namedtuple
    T = namedtuple('T', idict.keys())
    return T(**idict)


PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
SITE_ENV = dict(
    SITE_NAME="Hello",
    STATIC_URL="/static/",
)
SITE_ENV = dict_to_nt(SITE_ENV)
app = Bottle()
renderer = RendererPlugin(template_context={'SITE_ENV': SITE_ENV})
app.install(renderer)


@app.get('/', name='index', renderer='index.mako')
def index():
    return {"blogs": []}


@app.get('%s<filename:path>' % SITE_ENV.STATIC_URL, name='static')
def static(filename):
    return bottle.static_file(
        filename,
        root=os.path.join(PROJECT_ROOT, 'static')
    )


if __name__ == '__main__':
    bottle.TEMPLATE_PATH.append('./templates')
    bottle.debug(True)
    bottle.run(app=app, host='localhost', port=8080, reloader=True)
