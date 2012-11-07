import os

PROJECT_ROOT = os.path.dirname(os.path.realpath(os.path.dirname(__file__)))
def rel(*x):
    return os.path.join(PROJECT_ROOT, *x)

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('Sebastian Sassi', 'ssassi@sophilabs.com'),
    ('Pablo Ricco', 'pricco@sophilabs.com'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'devpro',
    }
}

TIME_ZONE = 'America/Chicago'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = True
USE_L10N = True
USE_TZ = True

MEDIA_ROOT = rel('media')
MEDIA_URL = '/media/'
STATIC_ROOT = rel('collectedstatic')
STATIC_URL = '/static/'
STATICFILES_DIRS = (
    rel('static'),
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

SECRET_KEY = 'i@$-buw6=-yjhc(y%o=4)8e%3t$d=^59s66*dbg_x%-@*nt&amp;=f'

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
)

ROOT_URLCONF = 'devpro.urls'

WSGI_APPLICATION = 'devpro.wsgi.application'

TEMPLATE_DIRS = (
    rel('templates')
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',

    'main',
)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

try:
    from local_settings import *
except ImportError:
    pass