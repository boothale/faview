"""
WSGI config for website project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os
from django.core.wsgi import get_wsgi_application
from django.conf import settings
from fa.file_serve import ServeStatic

#    'avatar'       : 'http://a.facdn.net',
#    'data'         : 'http://d.facdn.net',
#    'thumbnail'    : 'http://t.facdn.net',
#    'themes'       : 'http://www.furaffinity.net/themes',

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "website.settings")

application = ServeStatic(settings.MEDIA_ROOT + 'data', 'http://d.facdn.net', maxage = 2629000)
