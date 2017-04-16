from django.shortcuts import render, HttpResponse, render_to_response
from . forms import Formulario
from . lanzarModulos import modulos
from django.conf import settings

#Funcion para procesar las opciones elegidas por el usuario y lanzar el sistema experto
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
			return render(request,'resultados.html')

		else:
			return HttpResponse('No es valido')
	else:
		form = Formulario()

	return render(request,'formulario.html',{'form':form})

#Funcion auxiliar para guardar el archivo seleccionado
def subirArchivo(f):
	dir_destino = open(settings.MEDIA_ROOT + '.xml', 'wb+')
	for chunk in f.chunks():
		dir_destino.write(chunk)
	dir_destino.close()

#Funcion auxiliar para mostrar los resultados del sistema experto
def mostrarResultados(opciones):

	r_mod1,r_mod2,r_mod3 = []

	#Leemos los fallos de los modulos activados
	if('opcion1' in opciones):
		with open('./tfg_web/fallos/fallos_mod1','r') as f:
			for l in f:
				r_mod1.append(l)
		f.close()

	if('opcion2' in opciones):
		with open('./tfg_web/fallos/fallos_mod2','r') as f:
			for l in f:
				r_mod2.append(l)
		f.close()

	if('opcion3' in opciones):
		with open('./tfg_web/fallos/fallos_mod3','r') as f:
			for l in f:
				r_mod3.append(l)
		f.close()

	
		
