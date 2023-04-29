# """
# Django settings for bandist project.

# Generated by 'django-admin startproject' using Django 4.1.4.

# For more information on this file, see
# https://docs.djangoproject.com/en/4.1/topics/settings/

# For the full list of settings and their values, see
# https://docs.djangoproject.com/en/4.1/ref/settings/
# """

# from pathlib import Path

# # Build paths inside the project like this: BASE_DIR / 'subdir'.
# BASE_DIR = Path(__file__).resolve().parent.parent


# # Quick-start development settings - unsuitable for production
# # See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# # SECURITY WARNING: keep the secret key used in production secret!
# # SECRET_KEY = 'django-insecure-59d(4*a3y9wj9a^*%8qsq9u(orz=&_9alc)vqgp((1@+uy+px-'
# SECRET_KEY = "ui0pp)dodxk_wpwzbkn_@^mz-bq&^%c%h#8a(p-8my#y0oc1n1"
# # SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = True

# ALLOWED_HOSTS = []


# # Application definition

# INSTALLED_APPS = [
#     'app.apps.AppConfig',
#     'django.contrib.admin',
#     'django.contrib.auth',
#     'django.contrib.contenttypes',
#     'django.contrib.sessions',
#     'django.contrib.messages',
#     'django.contrib.staticfiles',
# ]

# MIDDLEWARE = [
#     'django.middleware.security.SecurityMiddleware',
#     'django.contrib.sessions.middleware.SessionMiddleware',
#     'django.middleware.common.CommonMiddleware',
#     'django.middleware.csrf.CsrfViewMiddleware',
#     'django.contrib.auth.middleware.AuthenticationMiddleware',
#     'django.contrib.messages.middleware.MessageMiddleware',
#     'django.middleware.clickjacking.XFrameOptionsMiddleware',
# ]

# ROOT_URLCONF = 'bandist.urls'

# TEMPLATES = [
#     {
#         'BACKEND': 'django.template.backends.django.DjangoTemplates',
#         'DIRS': [],
#         'APP_DIRS': True,
#         'OPTIONS': {
#             'context_processors': [
#                 'django.template.context_processors.debug',
#                 'django.template.context_processors.request',
#                 'django.contrib.auth.context_processors.auth',
#                 'django.contrib.messages.context_processors.messages',
#             ],
#         },
#     },
# ]

# WSGI_APPLICATION = 'bandist.wsgi.application'


# # Database
# # https://docs.djangoproject.com/en/4.1/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }


# # Password validation
# # https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

# AUTH_PASSWORD_VALIDATORS = [
#     {
#         'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
#     },
#     {
#         'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
#     },
#     {
#         'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
#     },
#     {
#         'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
#     },
# ]


# # Internationalization
# # https://docs.djangoproject.com/en/4.1/topics/i18n/

# LANGUAGE_CODE = 'en-us'

# TIME_ZONE = 'UTC'

# USE_I18N = True

# USE_TZ = True


# # Static files (CSS, JavaScript, Images)
# # https://docs.djangoproject.com/en/4.1/howto/static-files/

# STATIC_URL = 'static/'

# # Default primary key field type
# # https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

# DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# #SPOTIPY
# SPOTIPY_CLIENT_ID = "73179dc2625a435f8a3672b3379ceadd"
# SPOTIPY_CLIENT_SECRET = "74a1523073d9411ab200160c41f7e07f"
# SPOTIPY_REDIRECT_URI = "http://127.0.0.1:8000/login/callback/"


# #SEATGEEK
# SEATGEEK_CLIENT_ID = "MzE2NDYwNTB8MTY3NDc2NTA1MC42NTMyNjcx"
# SEATGEEK_CLIENT_SECRET = "a2351d302e8fb7bfc95b6240df4f45f1b792396653d69844b406505c5330b76c"


"""
Django settings for bandist project.
Generated by 'django-admin startproject' using Django 4.1.4.
For more information on this file, see
https://docs.djangoproject.com/en/4.1/topics/settings/
For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.1/ref/settings/
"""

from datetime import timedelta
from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-59d(4*a3y9wj9a^*%8qsq9u(orz=&_9alc)vqgp((1@+uy+px-'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

# REST_FRAMEWORK = {
#     'DEFAULT_PERMISSION_CLASSES':  [
#     'rest_framework.permissoins.IsAuthenticated',
#     'rest_framework.authentication.TokenAuthentication'
#     ],
#     'DEFAULT_AUTHENTICATION_CLASSES': (
#     'rest_framework_simplejwt.authentication.JWTAuthentication'
#     )
# }


SIMPLE_JWT = {
    'AUTH_HEADER_TYPES': ('JWT',),
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=60),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=1)
}

INSTALLED_APPS = [
    'app',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'corsheaders'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'corsheaders.middleware.CorsMiddleware'
]

ROOT_URLCONF = 'bandist.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'bandist.wsgi.application'

CORS_ORIGIN_WHITELIST = [
    "http://127.0.0.1:54591",
    "http://localhost:54591",
    "http://10.0.2.2:80",
    "http://localhost:80",
    "http://10.9.88.64:8000",
    "http://172.20.10.4:8000",
]

ALLOWED_HOSTS = ['localhost', '127.0.0.1',
                 '10.0.2.2', '10.9.88.64', '172.20.10.4']


# Database
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# SPOTIPY
SPOTIPY_CLIENT_ID = "954437538f1a472baf1170f0b2c39640"
SPOTIPY_CLIENT_SECRET = "2af8220890344e9ca0a77612f8609380"
SPOTIPY_REDIRECT_URI = "http://127.0.0.1:8000/login/callback/"

# SEATGEEK
SEATGEEK_CLIENT_ID = "MzE2NDYwNTB8MTY3NDc2NTA1MC42NTMyNjcx"
SEATGEEK_CLIENT_SECRET = "a2351d302e8fb7bfc95b6240df4f45f1b792396653d69844b406505c5330b76c"
