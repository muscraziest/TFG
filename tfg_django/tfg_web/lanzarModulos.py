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
		parserAcordes(partitura)

		#Ejecutamos las reglas de clips
		modulo3(opciones)


#Funcion para ejecutar las reglas de clips del modulo1
def modulo1():

	#Reseteamos entorno
	clips.Clear()
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

	#Creamos plantillas
	clips.BuildTemplate("tonalidad", "(slot nombre) (slot modo) (slot armadura) (slot sensible)")
	clips.BuildTemplate("intervalo", "(slot distancia) (slot tipo) (slot nota1) (slot nota2)")
	clips.BuildTemplate("posibleFallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
	clips.BuildTemplate("fallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
	clips.BuildTemplate("tonalidad_obra", "(slot nombre) (slot modo)")
	clips.BuildTemplate("nota", "(slot tono) (slot altura) (slot voz) (slot indice)")
	clips.BuildTemplate("movimiento", "(slot tipo) (slot voz) (slot indice)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo1.clp')

	#Ejecutamos
	clips.Run()


#Funcion para ejecutar las reglas de clips del modulo 2
def modulo2(opciones):

	if 'opcion1' in opciones:

		#Resetamos entorno
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

		clips.BuildTemplate("escala", "(slot nombre_t) (slot modo_t) (slot gradoI) (slot gradoII) (slot gradoIII) (slot gradoIV) (slot gradoV) (slot gradoVI) (slot gradoVII)")
		clips.BuildTemplate("intervalo_consonante", "(slot distancia) (slot tipo)")
		clips.BuildTemplate("intervalo_disonante", "(slot distancia) (slot tipo)")
		clips.BuildTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
		clips.BuildTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")
		clips.BuildTemplate("nota_melodia", "(slot tono) (slot altura) (slot voz) (slot indice)")


	else:

		#Reseteamos entorno
		clips.Clear()
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

		#Creamos plantillas
		clips.BuildTemplate("tonalidad", "(slot nombre) (slot modo) (slot armadura) (slot sensible)")
		clips.BuildTemplate("escala", "(slot nombre_t) (slot modo_t) (slot gradoI) (slot gradoII) (slot gradoIII) (slot gradoIV) (slot gradoV) (slot gradoVI) (slot gradoVII)")
		clips.BuildTemplate("intervalo", "(slot distancia) (slot tipo) (slot nota1) (slot nota2)")
		clips.BuildTemplate("intervalo_consonante", "(slot distancia) (slot tipo)")
		clips.BuildTemplate("intervalo_disonante", "(slot distancia) (slot tipo)")
		clips.BuildTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
		clips.BuildTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")
		clips.BuildTemplate("posibleFallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
		clips.BuildTemplate("fallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
		clips.BuildTemplate("tonalidad_obra", "(slot nombre) (slot modo)")
		clips.BuildTemplate("nota", "(slot tono) (slot altura) (slot voz) (slot indice)")
		clips.BuildTemplate("nota_melodia", "(slot tono) (slot altura) (slot voz) (slot indice)")
		clips.BuildTemplate("movimiento", "(slot tipo) (slot voz) (slot indice)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo2.clp')

	#Ejecutamos
	clips.Run()


#Funcion para ejecutar las reglas de clips del modulo 3
def modulo3(opciones):


	if ( ('opcion1' in opciones and 'opcion2' in opciones) or ('opcion2' in opciones and not('opcion1' in opciones))): 

		#Reseteamos entorno
		clips.Reset()

		#Creamos contadores
		clips.Assert("(contador_soprano 0)")
		clips.Assert("(contador_contraalto 0)")
		clips.Assert("(contador_tenor 0)")
		clips.Assert("(contador_bajo 0)")

		#Creamos plantillas
		clips.BuildTemplate("sucesion_logica", "(slot acorde1) (slot acorde2)")
		clips.BuildTemplate("acorde", "(slot grado) (slot septima) (slot inversion) (slot indice)")

	elif('opcion1' in opciones):

		#Reseteamos entorno
		clips.Reset()

		#Creamos contadores
		clips.Assert("(contador_soprano 0)")
		clips.Assert("(contador_contraalto 0)")
		clips.Assert("(contador_tenor 0)")
		clips.Assert("(contador_bajo 0)")


		#Creamos plantillas
		clips.BuildTemplate("sucesion_logica", "(slot acorde1) (slot acorde2)")
		clips.BuildTemplate("acorde", "(slot grado) (slot septima) (slot inversion) (slot indice)")
		clips.BuildTemplate("escala", "(slot nombre_t) (slot modo_t) (slot gradoI) (slot gradoII) (slot gradoIII) (slot gradoIV) (slot gradoV) (slot gradoVI) (slot gradoVII)")
		clips.BuildTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
		clips.BuildTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")
	
	else:

		#Creamos entorno
		clips.Clear()
		clips.Reset()

		#Creamos contadores
		clips.Assert("(contador_soprano 0)")
		clips.Assert("(contador_contraalto 0)")
		clips.Assert("(contador_tenor 0)")
		clips.Assert("(contador_bajo 0)")

		#Creamos plantillas
		clips.BuildTemplate("tonalidad", "(slot nombre) (slot modo) (slot armadura) (slot sensible)")
		clips.BuildTemplate("escala", "(slot nombre_t) (slot modo_t) (slot gradoI) (slot gradoII) (slot gradoIII) (slot gradoIV) (slot gradoV) (slot gradoVI) (slot gradoVII)")
		clips.BuildTemplate("intervalo", "(slot distancia) (slot tipo) (slot nota1) (slot nota2)")
		clips.BuildTemplate("sucesion_logica", "(slot acorde1) (slot acorde2)")
		clips.BuildTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
		clips.BuildTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")
		clips.BuildTemplate("acorde", "(slot grado) (slot septima) (slot inversion) (slot indice)")
		clips.BuildTemplate("posibleFallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
		clips.BuildTemplate("fallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
		clips.BuildTemplate("tonalidad_obra", "(slot nombre) (slot modo)")
		clips.BuildTemplate("nota", "(slot tono) (slot altura) (slot voz) (slot indice)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo3.clp')

	#Ejecutamos
	clips.Run()