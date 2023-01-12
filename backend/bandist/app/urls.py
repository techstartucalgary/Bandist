from django.urls import path, include
from . import views
from rest_framework import routers

# router = routers.DefaultRouter(trailing_slash=False)
# router.register('employeedetails', views.Employee)

urlpatterns = [
    path('login', views.login, name='login'),
    path('login/callback/', views.login_callback, name='login_callback'),
    # path('dashboard', views.dashboard, name='dashboard'),
    path('getInfo', views.getInfo, name='get_info'),
    # path('', include(router.urls)),

]
