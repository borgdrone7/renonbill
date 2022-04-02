"""backendrenonbill URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views imp`ort Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url
from django.urls import path, include, re_path
from rest_framework import routers

# Routers provide a way of automatically determining the URL conf.
from api.views import ReactAppView, ReactAppView1, ReactAppView2, ReactAppView3
from .views import UserViewSet

router = routers.DefaultRouter()
router.register(r'users', UserViewSet)

urlpatterns = [
    # path("", ReactAppView.as_view(), name="renonbill_frontend"),
    path('admin/', admin.site.urls),
    url(r'^api/', include('api.urls')),
    url(r'^api/', include(router.urls)),
    url(r'^(?P<boo>.*ico)$', ReactAppView1.as_view(), name="renonbill_frontend11"),
    url(r'^(?P<boo>.*png)$', ReactAppView1.as_view(), name="renonbill_frontend12"),
    url(r'^(?P<boo>.*jpg)$', ReactAppView1.as_view(), name="renonbill_frontend13"),
    url(r'^(?P<boo>.*json)$', ReactAppView1.as_view(), name="renonbill_frontend14"),
    url(r'^(?P<boo>.*js)$', ReactAppView2.as_view(), name="renonbill_frontend15"),
    url(r'^(?P<boo>.*css)$', ReactAppView3.as_view(), name="renonbill_frontend16"),
    re_path(r"^(?!api)$", ReactAppView.as_view(), name="renonbill_frontend1"),
    re_path(r"^(?!api)(?:.*)/?$", ReactAppView.as_view(), name="renonbill_frontend2"),
]

