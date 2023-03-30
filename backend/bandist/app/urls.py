# from django.urls import path
# from . import views

# urlpatterns = [
#     path('login', views.login, name='login'),
#     path('login/callback/', views.login_callback, name='login_callback'),
#     # path('dashboard', views.dashboard, name='dashboard'),
#     path('getInfo', views.getInfo, name='get_info'),
# ]

from django.urls import path
from . import views
from django.contrib import admin

urlpatterns = [
    path('', views.home, name='home'),
    path('login', views.login, name='login'),
    path('login/callback/', views.login_callback, name='login_callback'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('admin/', admin.site.urls),
    path('logout/', views.logout, name='logout'),
]