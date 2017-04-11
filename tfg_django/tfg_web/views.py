from django.shortcuts import render, HttpResponse
from . forms import Formulario
from . lanzarModulos import modulos
from django.conf import settings

# Create your views here.
def enviarDatos(request):

	if request.method == 'POST':
		form=Formulario(request.POST,request.FILES)

		if form.is_valid():

			data = form.cleaned_data
			opciones = data['opciones']
			partitura = data['partitura']

			#Comprobamos que la extension es correcta
			if not partitura.name.endswith('.xml'):
				return render(request,'error.html')

			#Subimos el archivo
			subirArchivo(request.FILES['partitura'])
			#Ejecutamos los modulos del sistema experto
			modulos(opciones,settings.MEDIA_ROOT+'.xml')
			return HttpResponse('Se ha subido correctamente!')

		else:
			return HttpResponse('No es valido')
	else:
		form = Formulario()

	return render(request,'formulario.html',{'form':form})

def subirArchivo(f):
	dir_destino = open(settings.MEDIA_ROOT + '.xml', 'wb+')
	for chunk in f.chunks():
		dir_destino.write(chunk)
	dir_destino.close()