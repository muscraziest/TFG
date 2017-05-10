# -*- coding: utf-8 -*-
# Codigo para extraer las lineas melodicas de las voces y los acordes
import xml.etree.ElementTree as ET

#Funcion para buscar la tonalidad de la obra
def parserTonalidad(partitura):

	tree = ET.parse(partitura)
	root = tree.getroot()
	tono_modo = ['','']

	#Array asociativo de las tonalidades segun las alteraciones
	tonos_mayores = {-7:'Cb', -6:'Gb', -5:'Db', -4:'Ab', -3:'Eb',-2:'Bb',-1:'F', 0:'C', 1:'G', 2:'D', 3:'A', 4:'E', 5:'B', 6:'F#', 7:'C#'}
	tonos_menores = {-7:'Abb', -6:'Eb', -5:'Bb', -4:'F', -3:'C',-2:'G',-1:'D', 0:'A', 1:'E', 2:'B', 3:'F#', 4:'C#', 5:'G#', 6:'D#', 7:'A#'}

	#Buscamos la tonalidad
	for key in root.iter('key'):
		tono_modo[0] = key.find('fifths').text
		tono_modo[1] = key.find('mode').text

	#Calculamos la tonalidad
	if tono_modo[1] == 'major':
		tonalidad = str(tonos_mayores[int(tono_modo[0])])
		tonalidad += ' mayor'
	else:
		tonalidad = str(tono_modo[int(tono_modo[0])])
		tonalidad += ' menor'

	f = open('./tfg_web/datos/tonalidad','w')
	f.write(tonalidad)
	f.close()

	return tono_modo

#Función para sacar el compás
def parserCompas(partitura):
	tree = ET.parse(partitura)
	root = tree.getroot()

	#Listas para extraer los datos
	beats_beat_type = ['','']

	#Buscamos el compas
	for time in root.iter('time'):
		beats_beat_type[0] = time.find('beats').text
		beats_beat_type[1] = time.find('beat-type').text

	#Guardamos el compas
	compas = beats_beat_type[0]
	compas += ' '
	compas += beats_beat_type[1]

	#Creamos un fichero y escribimos el compas extraido del xml
	f = open('./tfg_web/datos/compas','w')
	f.write(compas)
	f.close()

#Funcion para sacar las notas de todas las voces para analizar los acordes
def parserAcordes(partitura):

	tree = ET.parse(partitura)
	root = tree.getroot()

	#Listas para extraer los datos
	compas = ['','']
	soprano = []
	contraalto = []
	tenor = []
	bajo = []

	s = 0
	c = 0
	t = 0
	b = 0

	total_semicorcheas = 0
	contador_s = 0
	contador_c = 0
	contador_t = 0
	contador_b = 0
	
	#Calculamos la tonalidad
	tonalidad = parserTonalidad(partitura)
	
	#Buscamos el compas
	for time in root.iter('time'):
		compas[0] = time.find('beats').text
		compas[1] = time.find('beat-type').text
	
	#Calculamos el numero de semicorcheas por compas
	if int(compas[1]) == 4:
		total_semicorcheas = int(compas[0])*int(compas[1])
	if int(compas[1]) == 8:
		total_semicorcheas = int(compas[0])*2
	
	#Buscamos las notas para las distintas voces
	for note in root.iter('note'):
	
		rest = ''
		accidental = ''
		alter = ''

		#Buscamos la nota
		pitch = note.find('pitch')	

		#Si no esta vacia tomamos sus atributos
		if pitch is not None:
	
			#Buscamos el tono
			step = note.find('pitch').find('step')
	
			#Comprobamos si hay nota o es un silencio
			if step is not None:
				step = note.find('pitch').find('step').text
				rest = ''

			#Comprobamos si esta alterada por la armadura
			if note.find('pitch').find('alter') is not None:
				if int(tonalidad[0]) < 0:
					alter = 's'
				else:
					alter = 'b'

			#Buscamos la altura de la nota
			octave = note.find('pitch').find('octave').text

		else:
			rest = 'R'
			octave = '0'
			
		#Buscamos alteraciones accidentales
		#Si hay alteracion accidental comprobamos el tipo de alteracion
		if note.find('accidental') is not None:
			alter = ''
			if note.find('accidental').text == 'sharp':
				accidental = 's'
			elif note.find('accidental').text == 'flat':
				accidental = 'b'
			else: 
				accidental = ''

		#La nota no tiene ningun tipo de alteracion
		else:
			accidental = ''

		#Duracion y voz
		type = note.find('type').text
		dot = note.find('dot')

		#Comprobamos si tiene puntillo
		if dot is not None:
			dot = '.'
		else:
			dot = ''

		voice = note.find('voice').text

		#Voz soprano
		if voice == '1':

			#Duracion redonda
			if type == 'whole':
				#Redonda con puntillo
				if dot == '.':
					for i in range(0,24):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 24

				#Redonda
				else:

					for i in range(0,16):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 16

			#Duracionn blanca
			if type == 'half':
				#Blanca con puntillo
				if dot == '.':
					for i in range(0,12):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 12
				
				#Blanca
				else:

					for i in range(0,8):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 8

			#Duracion negra
			if type == 'quarter':
				#Negra con puntillo
				if dot == '.':
					for i in range(0,6):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 6

				#Negra
				else:

					for i in range(0,4):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 4

			#Duracion corchea
			if type == 'eighth':
				#Corchea con puntillo
				if dot == '.':
					for i in range(0,3):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 3

				#Corchea
				else:

					for i in range(0,2):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 2

			#Duracion semicorchea
			if type == '16th':
				#Semicorchea con puntillo
				if dot == '.':
					for i in range(0,2):
						if rest=='R':
							soprano.append(rest)
							soprano.append(' ')
							soprano.append(octave)
						else:
							soprano.append(step)
							soprano.append(alter)
							soprano.append(accidental)
							soprano.append(' ')
							soprano.append(octave)
						soprano.append(' ')
					contador_s = contador_s + 2

				#Semicorchea
				else:

					if rest=='R':
						soprano.append(rest)
						soprano.append(' ')
						soprano.append(octave)
					else:
						soprano.append(step)
						soprano.append(alter)
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
					soprano.append(' ')
				contador_s = contador_s + 1

			if contador_s == total_semicorcheas:
				contador_s = 0

			elif contador_s > total_semicorcheas:
				contador_s = contador_s % total_semicorcheas

		#Contraalto
		elif voice == '2':

			if type == 'whole':
				if dot == '.':
					for i in range(0,24):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 24

				else:

					for i in range(0,16):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 16


			if type == 'half':
				if dot == '.':
					for i in range(0,12):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 12

				else:

					for i in range(0,8):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 8

			if type == 'quarter':
				if dot == '.':
					for i in range(0,6):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 6

				else:

					for i in range(0,4):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 4

			if type == 'eighth':
				if dot == '.':
					for i in range(0,3):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 3

				else:

					for i in range(0,2):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 2

			#Duracion semicorchea
			if type == '16th':
				#Semicorchea con puntillo
				if dot == '.':
					for i in range(0,2):
						if rest=='R':
							contraalto.append(rest)
							contraalto.append(' ')
							contraalto.append(octave)
						else:
							contraalto.append(step)
							contraalto.append(alter)
							contraalto.append(accidental)
							contraalto.append(' ')
							contraalto.append(octave)
						contraalto.append(' ')
					contador_c = contador_c + 2

				#Semicorchea
				else:

					if rest=='R':
						contraalto.append(rest)
						contraalto.append(' ')
						contraalto.append(octave)
					else:
						contraalto.append(step)
						contraalto.append(alter)
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
					contraalto.append(' ')
				contador_c = contador_c + 1

			if contador_c == total_semicorcheas:
				contador_c = 0

			elif contador_c > total_semicorcheas:
				contador_c = contador_c % total_semicorcheas
			

		#Tenor
		elif voice == '3':
			if type == 'whole':
				if dot == '.':
					for i in range(0,24):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 24

				else:

					for i in range(0,16):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 16


			if type == 'half':
				if dot == '.':
					for i in range(0,12):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 12

				else:

					for i in range(0,8):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 8

			if type == 'quarter':
				if dot == '.':
					for i in range(0,6):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 6

				else:

					for i in range(0,4):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 4

			if type == 'eighth':
				if dot == '.':
					for i in range(0,3):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 3

				else:

					for i in range(0,2):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 2

			#Duracion semicorchea
			if type == '16th':
				#Semicorchea con puntillo
				if dot == '.':
					for i in range(0,2):
						if rest=='R':
							tenor.append(rest)
							tenor.append(' ')
							tenor.append(octave)
						else:
							tenor.append(step)
							tenor.append(alter)
							tenor.append(accidental)
							tenor.append(' ')
							tenor.append(octave)
						tenor.append(' ')
					contador_t = contador_t + 2

				#Semicorchea
				else:

					if rest=='R':
						tenor.append(rest)
						tenor.append(' ')
						tenor.append(octave)
					else:
						tenor.append(step)
						tenor.append(alter)
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
					tenor.append(' ')
				contador_t = contador_t + 1

			if contador_t == total_semicorcheas:
				contador_t = 0

			elif contador_t > total_semicorcheas:
				contador_t = contador_t % total_semicorcheas

			
		#Bajo
		elif voice == '4':

			if type == 'whole':
				if dot == '.':
					for i in range(0,24):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 24

				else:

					for i in range(0,16):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 16


			if type == 'half':
				if dot == '.':
					for i in range(0,12):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 12

				else:

					for i in range(0,8):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 8

			if type == 'quarter':
				if dot == '.':
					for i in range(0,6):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 6

				else:

					for i in range(0,4):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 4

			if type == 'eighth':
				if dot == '.':
					for i in range(0,3):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 3

				else:

					for i in range(0,2):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 2

			#Duracion semicorchea
			if type == '16th':
				#Semicorchea con puntillo
				if dot == '.':
					for i in range(0,2):
						if rest=='R':
							bajo.append(rest)
							bajo.append(' ')
							bajo.append(octave)
						else:
							bajo.append(step)
							bajo.append(alter)
							bajo.append(accidental)
							bajo.append(' ')
							bajo.append(octave)
						bajo.append(' ')
					contador_b = contador_b + 2

				#Semicorchea
				else:

					if rest=='R':
						bajo.append(rest)
						bajo.append(' ')
						bajo.append(octave)
					else:
						bajo.append(step)
						bajo.append(alter)
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
					bajo.append(' ')
				contador_b = contador_b + 1


			if contador_b == total_semicorcheas:
				contador_b = 0

			elif contador_b > total_semicorcheas:
				contador_b = contador_b % total_semicorcheas
				

	#Creamos un fichero y escribimos los datos extraidos del xml
	f = open('./tfg_web/datos/soprano_acordes','w')
	for i in soprano:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/contraalto_acordes','w')
	for i in contraalto:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/tenor_acordes','w')
	for i in tenor:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/bajo_acordes','w')
	for i in bajo:
		f.write(i)
	f.close()

#Funcion para sacar las notas de todas las voces para analizar las melodias
def parserMelodias(partitura):

	tree = ET.parse(partitura)
	root = tree.getroot()

	#Listas para extraer los datos
	soprano = []
	contraalto = []
	tenor = []
	bajo = []

	#Calculamos la tonalidad
	tonalidad = parserTonalidad(partitura)

	#Buscamos las notas para las distintas voces
	for note in root.iter('note'):
	
		rest = ''
		accidental = ''
		alter = ''

		#Buscamos la nota
		pitch = note.find('pitch')	

		#Si no esta vacia tomamos sus atributos
		if pitch is not None:
	
			#Buscamos el tono
			step = note.find('pitch').find('step')
	
			#Comprobamos si hay nota o es un silencio
			if step is not None:
				step = note.find('pitch').find('step').text
				rest = ''

			#Comprobamos si esta alterada por la armadura
			if note.find('pitch').find('alter') is not None:
				if int(tonalidad[0]) < 0:
					alter = 's'
				else:
					alter = 'b'

			#Buscamos la altura de la nota
			octave = note.find('pitch').find('octave').text

		else:
			rest = 'R'
			octave = '0'
			
		#Buscamos alteraciones accidentales
		#Si hay alteracion accidental comprobamos el tipo de alteracion
		if note.find('accidental') is not None:
			alter = ''
			if note.find('accidental').text == 'sharp':
				accidental = 's'
			elif note.find('accidental').text == 'flat':
				accidental = 'b'

		#La nota no tiene ningun tipo de alteracion
		else:
			accidental = ''

		#Duracion y voz
		type = note.find('type').text
		dot = note.find('dot')

		#Comprobamos si tiene puntillo
		if dot is not None:
			dot = '.'
		else:
			dot = ''

		voice = note.find('voice').text

		if voice == '1':
			if rest=='R':
				soprano.append(rest)
				soprano.append(' ')
				soprano.append(octave)
			else:
				soprano.append(step)
				soprano.append(alter)
				soprano.append(accidental)
				soprano.append(' ')
				soprano.append(octave)
			soprano.append(' ')

		elif voice == '2':

			if rest=='R':
				contraalto.append(rest)
				contraalto.append(' ')
				contraalto.append(octave)
			else:
				contraalto.append(step)
				contraalto.append(alter)
				contraalto.append(accidental)
				contraalto.append(' ')
				contraalto.append(octave)
			contraalto.append(' ')

		elif voice == '3':
			if rest=='R':
				tenor.append(rest)
				tenor.append(' ')
				tenor.append(octave)
			else:
				tenor.append(step)
				tenor.append(alter)
				tenor.append(accidental)
				tenor.append(' ')
				tenor.append(octave)
			tenor.append(' ')

		elif voice == '4':
			if rest=='R':
				tenor.append(rest)
				bajo.append(' ')
				bajo.append(octave)
			else:
				bajo.append(step)
				bajo.append(alter)
				bajo.append(accidental)
				bajo.append(' ')
				bajo.append(octave)
			bajo.append(' ')

	#Creamos un fichero y escribimos los datos extraidos del xml
	f = open('./tfg_web/datos/soprano_melodia','w')
	for i in soprano:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/contraalto_melodia','w')
	for i in contraalto:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/tenor_melodia','w')
	for i in tenor:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/bajo_melodia','w')
	for i in bajo:
		f.write(i)
	f.close()

#Funcion auxiliar para sacar los movimientos melodicos de una voz
def movimientosVoz(file):

	notas = []

	#Abrimos el archivo y almacenamos todas las notas en un vector
	f = open(file,'r')
	for linea in f:
		for nota in linea.split():
			notas.append(nota)
	f.close()

	movimientos = []

	#Establecemos un array asociatvio con el orden de las notas	
	orden = {'Cb':0.5,'C':1,'C#':1.5,'Db':1.55,'D':2,'D#':2.5,'Eb':2.55,'E':3,'E#':3.5,'Fb':3.55,'F':4,'F#':4.5,'Gb':4.55,'G':5,'G#':5.5,'Ab':5.55,'A':6,'A#':6.5,'Bb':6.55,'B':7,'B#':7.5};
 
	#Vamos comparando las notas de dos en dos
	for i in range(0,len(notas)-3):

		#Si las notas son distintas
		if(notas[i] != notas[i+2] and notas[i+1] != notas[i+3]):

			#Si estan en la misma altura
			if(notas[i+1] == notas[i+3]):

				if(orden(notas[i]) < orden(notas[i+2])):
					movimientos.append('ascendente ')
				else:
					movimientos.append('descendente ')

			#Si estan a distinta altura
			elif(notas[i+1] > notas[i+3]):
				movimientos.append('descendente ')

			else:
				movimientos.append('ascendente ')
		
		#Si son iguales
		else:
			movimientos.append('mantiene ')

		i = i+2

	return movimientos

#Funcion para sacar los movimientos melodicos de todas las voces para analizar los acordes
def parserMovimientosAcordes():

	movimientos_s = []
	movimientos_c = []
	movimientos_t = []
	movimientos_b = []

	#Sacamos los movimientos para cada voz
	movimientos_s = movimientosVoz('./tfg_web/datos/soprano_acordes')
	movimientos_c = movimientosVoz('./tfg_web/datos/contraalto_acordes')
	movimientos_t = movimientosVoz('./tfg_web/datos/tenor_acordes')
	movimientos_b = movimientosVoz('./tfg_web/datos/bajo_acordes')

	#Guardamos los movimientos de cada voz en un fichero
	f = open('./tfg_web/datos/soprano_movimientos_a','w')
	for i in movimientos_s:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/contraalto_movimientos_a','w')
	for i in movimientos_c:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/tenor_movimientos_a','w')
	for i in movimientos_t:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/bajo_movimientos_a','w')
	for i in movimientos_b:
		f.write(i)
	f.close()

#Funcion para sacar los movimientos melodicos de todas las voces para analizar la melodia
def parserMovimientosMelodias():

	movimientos_s = []
	movimientos_c = []
	movimientos_t = []
	movimientos_b = []

	#Sacamos los movimientos para cada voz
	movimientos_s = movimientosVoz('./tfg_web/datos/soprano_melodia')
	movimientos_c = movimientosVoz('./tfg_web/datos/contraalto_melodia')
	movimientos_t = movimientosVoz('./tfg_web/datos/tenor_melodia')
	movimientos_b = movimientosVoz('./tfg_web/datos/bajo_melodia')

	#Guardamos los movimientos de cada voz en un fichero
	f = open('./tfg_web/datos/soprano_movimientos_m','w')
	for i in movimientos_s:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/contraalto_movimientos_m','w')
	for i in movimientos_c:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/tenor_movimientos_m','w')
	for i in movimientos_t:
		f.write(i)
	f.close()

	f = open('./tfg_web/datos/bajo_movimientos_m','w')
	for i in movimientos_b:
		f.write(i)
	f.close()