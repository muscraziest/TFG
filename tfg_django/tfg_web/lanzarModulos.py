import clips
from . parser import *

def modulos(opciones,partitura):

	#Lanzamos el modulo 1
	if('opcion1' in opciones):

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserAcordes(partitura)
		parserMovimientosAcordes()

		#Ejecutamos las reglas de clips
		modulo1()

	if('opcion2' in opciones):

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserMelodias(partitura)
		parserMovimientosMelodias()

		#Ejecutamos las reglas de clips
		modulo2()

	if('opcion3' in opciones):

		#Parseamos la partitura
		parserTonalidad(partitura)
		parserAcordes(partitura)

		#Ejecutamos las reglas de clips
		modulo3()


#Funcion para ejecutar las reglas de clips del modulo1
def modulo1():

	#Reseteamos entorno
	clips.Clear()
	clips.Reset()

	# Cargamos contadores
	clips.Assert("(contador_soprano 0)")
	clips.Assert("(contador_contraalto 0)")
	clips.Assert("(contador_tenor 0)")
	clips.Assert("(contador_bajo 0)")
	clips.Assert("(contador_mov_soprano 0)")
	clips.Assert("(contador_mov_contraalto 0)")
	clips.Assert("(contador_mov_tenor 0)")
	clips.Assert("(contador_mov_bajo 0)")

	#Cargamos tonalidades
	cargarTonalidades()

	#Cargamos intervalos
	cargarIntervalos()

	#Cargamos plantillas fallos
	clips.BuildTemplate("posibleFallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
	clips.BuildTemplate("fallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")

	#Cargamos las plantillas necesarias para leer datos
	clips.BuildTemplate("tonalidad_obra", "(slot nombre) (slot modo)")
	clips.BuildTemplate("nota", "(slot tono) (slot altura) (slot voz) (slot indice)")
	clips.BuildTemplate("movimiento", "(slot tipo) (slot voz) (slot indice)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo1.clp')

	#Ejecutamos
	clips.Run()


#Funcion para ejecutar las reglas de clips del modulo 2
def modulo2():

	#Resetamos entorno
	clips.Clear()
	clips.Reset()

	#Cargamos contadores
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

	#Cargamos tonalidades
	cargarTonalidades()
	
	#Cargamos intervalos
	cargarIntervalos()
	cargarIntervalosConsonantes()
	cargarIntervalosDisonantes()

	#Cargamos escalas
	cargarEscalas()

	#Cargamos plantillas acordes
	clips.BuilTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
	clips.BuilTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")

	#Cargamos plantillas fallos
	clips.BuildTemplate("posibleFallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
	clips.BuildTemplate("fallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")

	#Cargamos las plantillas necesarias para leer datos
	clips.BuildTemplate("tonalidad_obra", "(slot nombre) (slot modo)")
	clips.BuildTemplate("nota", "(slot tono) (slot altura) (slot voz) (slot indice)")
	clips.BuildTemplate("nota_melodia", "(slot tono) (slot altura) (slot voz) (slot indice)")
	clips.BuildTemplate("movimiento", "(slot tipo) (slot voz) (slot indice)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo2.clp')

	#Ejecutamos
	clips.Run()


#Funcion para ejecutar las reglas de clips del modulo 3
def modulo3():

	#Resetamos entorno
	clips.Clear()
	clips.Reset()
	
	#Cargamos contadores
	clips.Assert("(contador_soprano 0)")
	clips.Assert("(contador_contraalto 0)")
	clips.Assert("(contador_tenor 0)")
	clips.Assert("(contador_bajo 0)")

	#Cargamos tonalidades
	cargarTonalidades()
	
	#Cargamos intervalos
	cargarIntervalos()

	#Cargamos escalas
	cargarEscalas()

	#Cargamos sucesiones logicas
	cargarSucionesLogicas()

	#Cargamos plantillas acordes
	clips.BuilTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
	clips.BuilTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")
	clips.BuilTemplate("acorde", "(slot grado) (slot septima) (slot inversion) (slot indice)")

	#Cargamos las reglas
	clips.Load('./tfg_web/reglas/reglas-modulo3.clp')

	#Ejecutamos
	clips.Run()


#Funcion auxiliar para insertar hechos referidos a las tonalidades
def cargarTonalidades():
	t = clips.BuildTemplate("tonalidad", "(slot nombre) (slot modo) (slot armadura) (slot sensible)")
	with open('./tfg_web/datos/plantilla_tonalidades','r') as tonalidades:
		for linea in tonalidades:
			slots = linea.split()
			f = clips.Fact(t)
			f.Slots['nombre'] = slots[0]
   			f.Slots['modo'] = slots[1]
   			f.Slots['armadura'] = slots[2]
			f.Slots['sensible'] = slots[3]
   			f.Assert()
   	tonalidades.close()


#Funcion auxiliar para insertar hechos referidos a las escalas
def cargarEscalas():
	t = clips.BuildTemplate("escala", "(slot nombre_t) (slot modo_t) (slot gradoI) (slot gradoII) (slot gradoIII) (slot gradoIV) (slot gradoV) (slot gradoVI) (slot gradoVII)")
	with open('./tfg_web/datos/plantilla_escalas','r') as escalas:
		for linea in escalas:
			slots = linea.split()
			f = clips.Fact(t)
			f.Slots['nombre_t'] = slots[0]
   			f.Slots['modo_t'] = slots[1]
   			f.Slots['gradoI'] = slots[2]
			f.Slots['gradoII'] = slots[3]
			f.Slots['gradoIII'] = slots[4]
			f.Slots['gradoIV'] = slots[5]
			f.Slots['gradoV'] = slots[6]
			f.Slots['gradoVI'] = slots[7]
			f.Slots['gradoVII'] = slots[8]
   			f.Assert()
   	escalas.close()


#Funcion auxiliar para insertar hechos referidos a los intervalos
def cargarIntervalos():
	t = clips.BuildTemplate("intervalo", "(slot distancia) (slot tipo) (slot nota1) (slot nota2)")
	with open('./tfg_web/datos/plantilla_intervalos','r') as intervalos:
		for linea in intervalos:
			slots = linea.split()
			f = clips.Fact(t)
			f.Slots['distancia'] = slots[0]
   			f.Slots['tipo'] = slots[1]
   			f.Slots['nota1'] = slots[2]
			f.Slots['nota2'] = slots[3]
   			f.Assert()
   	intervalos.close()

#Funcion auxiliar para insertar hechos referidos a los intervalos consonantes
def cargarIntervalosConsonantes():
	t = clips.BuildTemplate("intervalo_consonante", "(slot distancia) (slot tipo)")
	with open('./tfg_web/datos/plantilla_intervalos_consonantes','r') as intervalos:
		for linea in intervalos:
			slots = linea.split()
			f = clips.Fact(t)
			f.Slots['distancia'] = slots[0]
   			f.Slots['tipo'] = slots[1]	  			
   			f.Assert()
   	intervalos.close()

#Funcion auxiliar para insertar hechos referidos a los intervalos disonantes
def cargarIntervalosDisonantes():
	t = clips.BuildTemplate("intervalo_disonante", "(slot distancia) (slot tipo)")
	with open('./tfg_web/datos/plantilla_intervalos_disonantes','r') as intervalos:
		for linea in intervalos:
			slots = linea.split()
			f = clips.Fact(t)
			f.Slots['distancia'] = slots[0]
   			f.Slots['tipo'] = slots[1]	  			
   			f.Assert()
   	intervalos.close()

#Funcion auxiliar para insertar hechos referidos a las sucesiones logicas
def cargarSucionesLogicas():
	t = clips.BuildTemplate("sucesion_logica", "(slot acorde1) (slot acorde2)")
	with open('./tfg_web/datos/plantilla_sucesiones_logicas','r') as sucesiones:
		for linea in sucesiones:
			slots = linea.split()
			f = clips.Fact(t)
			f.Slots['acorde1'] = slots[0]
   			f.Slots['acorde2'] = slots[1]	  			
   			f.Assert()
   	sucesiones.close()