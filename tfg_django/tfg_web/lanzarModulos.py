from . parser import *
import clips

def modulos(opciones,partitura):

	#Lanzamos el modulo 1
	if('opcion1' in opciones):

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserAcordes(partitura)
		parserMovimientosAcordes()

		#Ejecutamos las reglas de clips
		clips.Clear()
		clips.Reset()
		clips.Load("./tfg_web/modulo1.clp")
		clips.Run()

	if('opcion2' in opciones):

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserMelodias(partitura)
		parserMovimientosMelodias()

		#Ejecutamos las reglas de clips
		clips.Clear()
		clips.Reset()
		clips.Load("./tfg_web/modulo2.clp")
		clips.Run()

	if('opcion3' in opciones):

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserAcordes(partitura)

		#Ejecutamos las reglas de clips
		clips.Clear()
		clips.Reset()
		clips.Load("./tfg_web/modulo3.clp")
		clips.Run()