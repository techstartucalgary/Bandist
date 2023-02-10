from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('login', views.login, name='login'),
    path('login/callback/', views.login_callback, name='login_callback'),
    path('getInfo', views.getInfo, name='get_info'),

    path('dashboard/', views.dashboard, name='dashboard'),
]
