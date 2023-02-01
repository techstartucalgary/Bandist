from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('login', views.login, name='login'),
    path('login/callback/', views.login_callback, name='login_callback'),
<<<<<<< HEAD
    # path('dashboard', views.dashboard, name='dashboard'),
    path('getInfo', views.getInfo, name='get_info'),
=======
    path('dashboard/', views.dashboard, name='dashboard'),
>>>>>>> ac3f09f79d5058b3588d9e8ea60524d9e5203403
]
