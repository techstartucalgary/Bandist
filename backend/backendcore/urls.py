from django.urls import path, include
from . import views

urlpatterns = [
    path('hellodjango', views.hello_django, name ='hellodjango'),
]
