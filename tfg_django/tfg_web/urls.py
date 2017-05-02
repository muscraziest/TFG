from django.conf.urls import url
from django.contrib import admin
from . import views
from cargarModulos import crearPlantillas

urlpatterns = [
	url(r'^tfg/indice',views.enviarDatos,name='indice'),
	url(r'^tfg/resultados',views.enviarDatos,name='resultados'),
]

#Creamos las plantillas para los modulos del sistema experto
crearPlantillas()