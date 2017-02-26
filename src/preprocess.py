# Codigo para extraer las lineas melodicas de las voces y los acordes
import xml.etree.ElementTree as ET
tree = ET.parse("aveverum.xml")
root = tree.getroot()

#Listas para extraer los datos
key_mode = ['','']
lista_notas_soprano = []
lista_notas_contraalto = []
lista_notas_tenor = []
lista_notas_bajo = []
beats_beat_type = ['','']

movimientos_soprano = []
movimientos_contraalto = []
movimientos_tenor = []
movimientos_bajo = []

soprano = []
contraalto = []
tenor = []
bajo = []

tiempo_compas = 0
contador_s = 0
contador_c = 0
contador_t = 0
contador_b = 0

#Array asociativo de las tonalidades segun las alteraciones
tonos_mayores = {-7:'Cb', -6:'Gb', -5:'Db', -4:'Ab', -3:'Eb',-2:'Bb',-1:'F', 0:'C', 1:'G', 2:'D', 3:'A', 4:'E', 5:'B', 6:'F#', 7:'C#'}
tonos_menores = {-7:'Abb', -6:'Eb', -5:'Bb', -4:'F', -3:'C',-2:'G',-1:'D', 0:'A', 1:'E', 2:'B', 3:'F#', 4:'C#', 5:'G#', 6:'D#', 7:'A#'}

#Buscamos la tonalidad
for key in root.iter('key'):
	key_mode[0] = key.find('fifths').text
	key_mode[1] = key.find('mode').text

#Calculamos la tonalidad
if key_mode[1] == 'major':
	tonalidad = tonos_mayores[int(key_mode[0])]
	tonalidad += ' mayor'
else:
	tonalidad = tonos_menores[int(key_mode[0])]
	tonalidad += ' menor'

#Buscamos el compas
for time in root.iter('time'):
	beats_beat_type[0] = time.find('beats').text
	beats_beat_type[1] = time.find('beat-type').text

#Guardamos el compas
compas = beats_beat_type[0]
compas += ' por '
compas += beats_beat_type[1]

#Calculamos el numero de semicorcheas por compas
if int(beats_beat_type[1]) == 4:
	tiempo_compas = int(beats_beat_type[0])*int(beats_beat_type[1])
if int(beats_beat_type[1]) == 8:
	tiempo_compas = int(beats_beat_type[0])*2

#Buscamos las notas para las distintas voces
for note in root.iter('note'):

	rest = ''
	accidental = ''

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
		else:
			rest = '$'
		
		#Buscamos alteraciones accidentales
		accidental = note.find('accidental')

		#Si hay alteracion accidental comprobamos el tipo de alteracion
		if accidental is not None:
			if note.find('accidental').text == 'sharp':
				accidental = '#'
			elif note.find('accidental').text == 'flat':
				accidental = 'b'
			else:
				accidental = 'bc'

		#Si no, comprobamos si esta alterada por la armadura
		elif note.find('pitch').find('alter') is not None:
			accidental = 'N'
			if int(key_mode[0]) > 0:
				accidental = '#'
			else:
				accidental = 'b'

		#La nota no tiene ningun tipo de alteracion
		else:
			accidental = 'N'

		#Buscamos la altura de la nota, duracion y voz
		octave = note.find('pitch').find('octave').text
		type = note.find('type').text
		dot = note.find('dot')

		if dot is not None:
			dot = '.'
		else:
			dot = ''

		voice = note.find('voice').text

	if voice == '1':
		if rest=='$':
			lista_notas_soprano.append(rest)
		else:
			lista_notas_soprano.append(step)

			lista_notas_soprano.append(accidental)
			lista_notas_soprano.append(octave)
			#lista_notas_soprano.append(type)
			lista_notas_soprano.append(' ')

		if type == 'whole':
			if dot == '.':
				for i in range(0,24):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 24

			else:

				for i in range(0,16):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 16


		if type == 'half':
			if dot == '.':
				for i in range(0,12):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 12

			else:

				for i in range(0,8):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 8

		if type == 'quarter':
			if dot == '.':
				for i in range(0,6):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 6

			else:

				for i in range(0,4):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 4

		if type == 'eighth':
			if dot == '.':
				for i in range(0,2):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 2

			else:

				for i in range(0,3):
					if rest=='$':
						soprano.append(rest)
					else:
						soprano.append(step)
						soprano.append(' ')
						soprano.append(accidental)
						soprano.append(' ')
						soprano.append(octave)
						soprano.append(' ')
				contador_s = contador_s + 3

		if contador_s == tiempo_compas:
			lista_notas_soprano.append('| ')
			#soprano.append('| ')
			contador_s = 0

		elif contador_s > tiempo_compas:
			lista_notas_soprano.append('| ')
			#soprano.append('| ')
			contador_s = contador_s % tiempo_compas

	elif voice == '2':

		if rest=='$':
			lista_notas_contraalto.append(rest)
		else:
			lista_notas_contraalto.append(step)

			lista_notas_contraalto.append(accidental)
			lista_notas_contraalto.append(octave)
			#lista_notas_contraalto.append(type)
			lista_notas_contraalto.append(' ')

		if type == 'whole':
			if dot == '.':
				for i in range(0,24):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 24

			else:

				for i in range(0,16):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 16


		if type == 'half':
			if dot == '.':
				for i in range(0,12):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 12

			else:

				for i in range(0,8):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 8

		if type == 'quarter':
			if dot == '.':
				for i in range(0,6):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 6

			else:

				for i in range(0,4):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 4

		if type == 'eighth':
			if dot == '.':
				for i in range(0,2):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 2

			else:

				for i in range(0,3):
					if rest=='$':
						contraalto.append(rest)
					else:
						contraalto.append(step)
						contraalto.append(' ')
						contraalto.append(accidental)
						contraalto.append(' ')
						contraalto.append(octave)
						contraalto.append(' ')
				contador_c = contador_c + 3

		if contador_c == tiempo_compas:
			lista_notas_contraalto.append('| ')
			#contraalto.append('| ')
			contador_c = 0

		elif contador_c > tiempo_compas:
			lista_notas_contraalto.append('| ')
			#contraalto.append('| ')
			contador_c = contador_c % tiempo_compas

	elif voice == '3':
		if rest=='$':
			lista_notas_tenor.append(rest)
		else:
			lista_notas_tenor.append(step)

			lista_notas_tenor.append(accidental)
			lista_notas_tenor.append(octave)
			#lista_notas_tenor.append(type)
			lista_notas_tenor.append(' ')

		if type == 'whole':
			if dot == '.':
				for i in range(0,24):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 24

			else:

				for i in range(0,16):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 16


		if type == 'half':
			if dot == '.':
				for i in range(0,12):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 12

			else:

				for i in range(0,8):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 8

		if type == 'quarter':
			if dot == '.':
				for i in range(0,6):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 6

			else:

				for i in range(0,4):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 4

		if type == 'eighth':
			if dot == '.':
				for i in range(0,2):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 2

			else:

				for i in range(0,3):
					if rest=='$':
						tenor.append(rest)
					else:
						tenor.append(step)
						tenor.append(' ')
						tenor.append(accidental)
						tenor.append(' ')
						tenor.append(octave)
						tenor.append(' ')
				contador_t = contador_t + 3

		if contador_t == tiempo_compas:
			lista_notas_tenor.append('| ')
			#tenor.append('| ')
			contador_t = 0

		elif contador_t > tiempo_compas:
			lista_notas_tenor.append('| ')
			#tenor.append('| ')
			contador_t = contador_t % tiempo_compas

	elif voice == '4':

		if rest=='$':
			lista_notas_bajo.append(rest)
		else:
			lista_notas_bajo.append(step)

			lista_notas_bajo.append(accidental)
			lista_notas_bajo.append(octave)
			#lista_notas_bajo.append(type)
			lista_notas_bajo.append(' ')

		if type == 'whole':
			if dot == '.':
				for i in range(0,24):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 24

			else:

				for i in range(0,16):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 16


		if type == 'half':
			if dot == '.':
				for i in range(0,12):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')	
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 12

			else:

				for i in range(0,8):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 8

		if type == 'quarter':
			if dot == '.':
				for i in range(0,6):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')	
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 6

			else:

				for i in range(0,4):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 4

		if type == 'eighth':
			if dot == '.':
				for i in range(0,2):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)	
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 2

			else:

				for i in range(0,3):
					if rest=='$':
						bajo.append(rest)
					else:
						bajo.append(step)
						bajo.append(' ')
						bajo.append(accidental)
						bajo.append(' ')
						bajo.append(octave)
						bajo.append(' ')
				contador_b = contador_b + 3

		if contador_b == tiempo_compas:
			lista_notas_bajo.append('| ')
			#bajo.append('| ')
			contador_b = 0

		elif contador_b > tiempo_compas:
			lista_notas_bajo.append('| ')
			#bajo.append('| ')
			contador_b = contador_b % tiempo_compas

#Creamos un fichero y escribimos los datos extraidos del xml
f = open('acordes','w')
f.write(tonalidad)
f.write('\n\n')
f.write(compas)
f.write('\n\n')

for i in lista_notas_soprano:
	f.write(i)

f.write('\n\n')

for i in lista_notas_contraalto:
	f.write(i)

f.write('\n\n')

for i in lista_notas_tenor:
	f.write(i)

f.write('\n\n')

for i in lista_notas_bajo:
	f.write(i)

f2 = open('Soprano','w')

for i in soprano:
	f2.write(i)

f3 = open('Contraalto','w')

for i in contraalto:
	f3.write(i)

f4 = open('Tenor','w')

for i in tenor:
	f4.write(i)

f5 = open('Bajo','w')

for i in bajo:
	f5.write(i)


f.close()
f2.close()
f3.close()
f4.close()
f5.close()
