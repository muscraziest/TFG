import clips

def crearPlantillas():

	#Creamos plantillas
	clips.BuildTemplate("tonalidad", "(slot nombre) (slot modo) (slot armadura) (slot sensible)")
	clips.BuildTemplate("intervalo", "(slot distancia) (slot tipo) (slot nota1) (slot nota2)")
	clips.BuildTemplate("posibleFallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
	clips.BuildTemplate("fallo", "(slot tipo) (slot voz1) (slot voz2) (slot tiempo)")
	clips.BuildTemplate("tonalidad_obra", "(slot nombre) (slot modo)")
	clips.BuildTemplate("nota", "(slot tono) (slot altura) (slot voz) (slot indice)")
	clips.BuildTemplate("movimiento", "(slot tipo) (slot voz) (slot indice)")
	clips.BuildTemplate("escala", "(slot nombre_t) (slot modo_t) (slot gradoI) (slot gradoII) (slot gradoIII) (slot gradoIV) (slot gradoV) (slot gradoVI) (slot gradoVII)")
	clips.BuildTemplate("intervalo_consonante", "(slot distancia) (slot tipo)")
	clips.BuildTemplate("intervalo_disonante", "(slot distancia) (slot tipo)")
	clips.BuildTemplate("acorde_3", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta)")
	clips.BuildTemplate("acorde_4", "(slot grado) (slot nombre_tonalidad) (slot modo_tonalidad) (slot fundamental) (slot tercera) (slot quinta) (slot septima)")
	clips.BuildTemplate("nota_melodia", "(slot tono) (slot altura) (slot voz) (slot indice)")
	clips.BuildTemplate("sucesion_logica", "(slot acorde1) (slot acorde2)")
	clips.BuildTemplate("acorde", "(slot grado) (slot septima) (slot inversion) (slot indice)")


