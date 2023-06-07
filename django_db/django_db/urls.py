"""django_db URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path, include
from rest_framework.routers import DefaultRouter

from Request_Info.views import RequestInfoViews
from User_AgentInfo.views import AgentInfoViews
from User_Info.views import UserInfoViews
from User_MyCar.views import MyCarInfoViews
from Contract_Info.views import ContractInfoViews
from Review_Info.views import ReviewInfoViews
from django.contrib import admin


router = DefaultRouter()
router.register('UserInfoApi',UserInfoViews,basename='UserInfo')
router.register('AgentInfoApi',AgentInfoViews,basename='AgentInfo')
router.register('RequestInfoApi',RequestInfoViews,basename='RequestInfo')
router.register('MyCarInfoApi',MyCarInfoViews,basename='MyCar')
router.register('ContractInfoApi',ContractInfoViews,basename='ContractInfo')
router.register('ReviewInfoApi',ReviewInfoViews,basename='ReviewInfo')
urlpatterns = [
    path('api/', include(router.urls)),
    path('admin/', admin.site.urls),
]
#http://192.168.0.135:8000/api/UserInfoApi