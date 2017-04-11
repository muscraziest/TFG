from django.conf.urls import url
from django.contrib import admin
from . import views

urlpatterns = [
	url(r'^tfg/',views.enviarDatos,name='tfg'),
]
