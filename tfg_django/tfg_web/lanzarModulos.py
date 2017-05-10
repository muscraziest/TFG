import clips
import os
from . parser import *

def modulos(opciones,partitura):

	#Lanzamos el modulo 1
	if('opcion1' in opciones):

		#Creamos el archivo para guardar los resultados
		if not os.path.exists("./tfg_web/fallos/fallos_mod1"):
			open("./tfg_web/fallos/fallos_mod1", "a").close()

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserCompas(partitura)
		parserAcordes(partitura)
		parserMovimientosAcordes()

		#Ejecutamos las reglas de clips
		modulo1()

	if('opcion2' in opciones):

		#Creamos el archivo para guardar los resultados
		if not os.path.exists("./tfg_web/fallos/fallos_mod2"):
			open("./tfg_web/fallos/fallos_mod2", "a").close()

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserCompas(partitura)
		parserMelodias(partitura)
		parserMovimientosMelodias()

		#Ejecutamos las reglas de clips
		modulo2(opciones)

	if('opcion3' in opciones):

		#Creamos el archivo para guardar los resultados
		if not os.path.exists("./tfg_web/fallos/fallos_mod3"):
			open("./tfg_web/fallos/fallos_mod3", "a").close()

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserCompas(partitura)
		parserAcordes(partitura)

		#Ejecutamos las reglas de clips
		modulo3(opciones)


#Funcion para ejecutar las reglas de clips del modulo1
def modulo1():

	#Reseteamos entorno
	clips.Reset()

	# Creamos contadores
	clips.Assert("(contador_soprano 0)")
	clips.Assert("(contador_contraalto 0)")
	clips.Assert("(contador_tenor 0)")
	clips.Assert("(contador_bajo 0)")
	clips.Assert("(contador_mov_soprano 0)")
	clips.Assert("(contador_mov_contraalto 0)")
	clips.Assert("(contador_mov_tenor 0)")
	clips.Assert("(contador_mov_bajo 0)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo1.clp')

	#Ejecutamos
	clips.Run()

#Funcion para ejecutar las reglas de clips del modulo 2
def modulo2(opciones):

	#Reseteamos entorno
	clips.Reset()

	#Creamos contadores
	clips.Assert("(contador_mov_soprano 0)")
	clips.Assert("(contador_melodia_soprano 0)")
	clips.Assert("(contador_mov_contraalto 0)")
	clips.Assert("(contador_melodia_contraalto 0)")
	clips.Assert("(contador_mov_tenor 0)")
	clips.Assert("(contador_melodia_tenor 0)")
	clips.Assert("(contador_mov_bajo 0)")
	clips.Assert("(contador_melodia_bajo 0)")
	clips.Assert("(movContrariosExtremos 0)")
	clips.Assert("(movDirectosExtremos 0)")
	clips.Assert("(movOblicuosExtremos 0)")
	clips.Assert("(saltosGrandesSoprano 0)")
	clips.Assert("(saltosPequenosSoprano 0)")
	clips.Assert("(saltosGrandesContraalto 0)")
	clips.Assert("(saltosPequenosContraalto 0)")
	clips.Assert("(saltosGrandesTenor 0)")
	clips.Assert("(saltosPequenosTenor 0)")
	clips.Assert("(saltosGrandesBajo 0)")		   
	clips.Assert("(saltosPequenosBajo 0)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo2.clp')

	#Ejecutamos
	clips.Run()


#Funcion para ejecutar las reglas de clips del modulo 3
def modulo3(opciones):

	#Creamos entorno
	clips.Reset()

	#Creamos contadores
	clips.Assert("(contador_soprano 0)")
	clips.Assert("(contador_contraalto 0)")
	clips.Assert("(contador_tenor 0)")
	clips.Assert("(contador_bajo 0)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo3.clp')

	#Ejecutamos
	clips.Run()