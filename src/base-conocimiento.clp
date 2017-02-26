;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;			HECHOS ASERTADOS 		      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Hechos asertados auxiliares
(deffacts contadores
	(contador_soprano 0)
	(contador_mov_soprano 0)
	(contador_melodia_soprano 0)
	(contador_contraalto 0)
	(contador_mov_contraalto 0)
	(contador_melodia_contraalto 0)
	(contador_tenor 0)
	(contador_mov_tenor 0)
	(contador_melodia_tenor 0)
	(contador_bajo 0)
	(contador_mov_bajo 0)
	(contador_melodia_bajo 0)
	(movContrariosExtremos 0)
	(movDirectosExtremos 0)
	(movOblicuosExtremos 0)
	(saltosGrandesSoprano 0)
	(saltosPequeñosSoprano 0)
	(saltosGrandesContraalto 0)
	(saltosPequeñosContraalto 0)
	(saltosGrandesTenor 0)
	(saltosPequeñosTenor 0)
	(saltosGrandesBajo 0)
	(saltosPequeñosBajo 0)
)

(deffacts partesDebiles
	(parteDebil 5)
	(parteDebil 6)
	(parteDebil 7)
	(parteDebil 8)
	(parteDebil 13)
	(parteDebil 14)
	(parteDebil 15)
	(parteDebil 16)
)

(deffacts partesFuertes
	(parteFuerte 1)
	(parteFuerte 2)
	(parteFuerte 3)
	(parteFuerte 4)
	(parteFuerte 9)
	(parteFuerte 10)
	(parteFuerte 11)
	(parteFuerte 12)
)

(deftemplate posibleFallo

	(slot tipo)
	(slot voz1)
	(slot voz2)
	(slot tiempo)
)

(deftemplate fallo

	(slot tipo)
	(slot voz1)
	(slot voz2)
	(slot tiempo)
)

(deftemplate acorde

	(slot grado)
	(slot septima)
	(slot inversion)
	(slot indice)
)

(deftemplate notaExtraña

	(slot voz)
	(slot indice)
)

(deftemplate notaPaso

	(slot voz)
	(slot indice)
)

(deftemplate notaFloreo

	(slot voz)
	(slot indice)
)

(deftemplate notaApoyatura

	(slot voz)
	(slot indice)
)


;Hechos asertados como conocimiento de teoría musical

;TONALIDADES
(deftemplate tonalidad
	(slot nombre)
	(slot modo)
	(slot armadura)
	(slot sensible)
)

(deffacts tonalidades 
	(tonalidad (nombre Cb) (modo mayor) (armadura 7b) (sensible Bb))
	(tonalidad (nombre Gb) (modo mayor) (armadura 6b) (sensible F))
	(tonalidad (nombre Db) (modo mayor) (armadura 5b) (sensible C))
	(tonalidad (nombre Ab) (modo mayor) (armadura 4b) (sensible G))
	(tonalidad (nombre Eb) (modo mayor) (armadura 3b) (sensible D))
	(tonalidad (nombre Bb) (modo mayor) (armadura 2b) (sensible A))
	(tonalidad (nombre F) (modo mayor) (armadura 1b) (sensible E))
	(tonalidad (nombre C) (modo mayor) (armadura 0) (sensible B))
	(tonalidad (nombre G) (modo mayor) (armadura 1s) (sensible Fs))
	(tonalidad (nombre D) (modo mayor) (armadura 2s) (sensible Cs))
	(tonalidad (nombre A) (modo mayor) (armadura 3s) (sensible Gs))
	(tonalidad (nombre E) (modo mayor) (armadura 4s) (sensible Ds))
	(tonalidad (nombre B) (modo mayor) (armadura 5s) (sensible As))
	(tonalidad (nombre Fs) (modo mayor) (armadura 6s) (sensible Es))
	(tonalidad (nombre Ds) (modo mayor) (armadura 7s) (sensible Css))

	(tonalidad (nombre Ab) (modo menor) (armadura 7b) (sensible G))
	(tonalidad (nombre Eb) (modo menor) (armadura 6b) (sensible D))
	(tonalidad (nombre Bb) (modo menor) (armadura 5b) (sensible A))
	(tonalidad (nombre F) (modo menor) (armadura 4b) (sensible E))
	(tonalidad (nombre C) (modo menor) (armadura 3b) (sensible B))
	(tonalidad (nombre G) (modo menor) (armadura 2b) (sensible Fs))
	(tonalidad (nombre D) (modo menor) (armadura 1b) (sensible Cs))
	(tonalidad (nombre A) (modo menor) (armadura 0) (sensible Gs))
	(tonalidad (nombre E) (modo menor) (armadura 1s) (sensible Ds))
	(tonalidad (nombre B) (modo menor) (armadura 2s) (sensible As))
	(tonalidad (nombre Fs) (modo menor) (armadura 3s) (sensible Es))
	(tonalidad (nombre Cs) (modo menor) (armadura 4s) (sensible Bs))
	(tonalidad (nombre Gs) (modo menor) (armadura 5s) (sensible Fss))
	(tonalidad (nombre Ds) (modo menor) (armadura 6s) (sensible Css))
	(tonalidad (nombre As) (modo menor) (armadura 7s) (sensible Gss))
)

;RELATIVOS
(deftemplate relativo

	(slot nombre1)
	(slot modo1)
	(slot nombre2)
	(slot modo2)
)


(deffacts relativos
	(relativo (nombre1 Cb) (modo1 mayor) (nombre2 Ab) (modo2 menor))
	(relativo (nombre1 Gb) (modo1 mayor) (nombre2 Eb) (modo2 menor))
	(relativo (nombre1 Db) (modo1 mayor) (nombre2 Bb) (modo2 menor))
	(relativo (nombre1 Ab) (modo1 mayor) (nombre2 F) (modo2 menor)) 
	(relativo (nombre1 Eb) (modo1 mayor) (nombre2 C) (modo2 menor)) 
	(relativo (nombre1 Bb) (modo1 mayor) (nombre2 G) (modo2 menor))
	(relativo (nombre1 F) (modo1 mayor) (nombre2 D) (modo2 menor))
	(relativo (nombre1 C) (modo1 mayor) (nombre2 A) (modo2 menor))
	(relativo (nombre1 G) (modo1 mayor) (nombre2 E) (modo2 menor))
	(relativo (nombre1 D) (modo1 mayor) (nombre2 B) (modo2 menor))
	(relativo (nombre1 A) (modo1 mayor) (nombre2 Fs) (modo2 menor))
	(relativo (nombre1 E) (modo1 mayor) (nombre2 Cs) (modo2 menor))
	(relativo (nombre1 B) (modo1 mayor) (nombre2 Gs) (modo2 menor))
	(relativo (nombre1 Fs) (modo1 mayor) (nombre2 Ds) (modo2 menor))
	(relativo (nombre1 Ds) (modo1 mayor) (nombre2 As) (modo2 menor))
)


;ESCALAS
(deftemplate escala

	(slot nombre_t)
	(slot modo_t)
	(slot gradoI)
	(slot gradoII)
	(slot gradoIII)
	(slot gradoIV)
	(slot gradoV)
	(slot gradoVI)
	(slot gradoVII)
)

(deffacts escalas

	(escala (nombre_t Cb) (modo_t mayor) (gradoI Cb) (gradoII Db) (gradoIII Eb) (gradoIV Fb) (gradoV Gb) (gradoVI Ab) (gradoVII Bb))
	(escala (nombre_t Gb) (modo_t mayor) (gradoI Gb) (gradoII Ab) (gradoIII Bb) (gradoIV Cb) (gradoV Db) (gradoVI Eb) (gradoVII F))
	(escala (nombre_t Db) (modo_t mayor) (gradoI Db) (gradoII Eb) (gradoIII F) (gradoIV Gb) (gradoV Ab) (gradoVI Bb) (gradoVII C))
	(escala (nombre_t Ab) (modo_t mayor) (gradoI Ab) (gradoII Bb) (gradoIII C) (gradoIV Db) (gradoV Eb) (gradoVI F) (gradoVII G))
	(escala (nombre_t Eb) (modo_t mayor) (gradoI Eb) (gradoII F) (gradoIII G) (gradoIV Ab) (gradoV Bb) (gradoVI C) (gradoVII D))
	(escala (nombre_t Bb) (modo_t mayor) (gradoI Bb) (gradoII C) (gradoIII D) (gradoIV Eb) (gradoV F) (gradoVI G) (gradoVII A))
	(escala (nombre_t F) (modo_t mayor) (gradoI F) (gradoII G) (gradoIII A) (gradoIV Bb) (gradoV C) (gradoVI D) (gradoVII E))
	(escala (nombre_t C) (modo_t mayor) (gradoI C) (gradoII D) (gradoIII E) (gradoIV F) (gradoV G) (gradoVI A) (gradoVII B))
	(escala (nombre_t G) (modo_t mayor) (gradoI G) (gradoII A) (gradoIII B) (gradoIV C) (gradoV D) (gradoVI E) (gradoVII Fs))
	(escala (nombre_t D) (modo_t mayor) (gradoI D) (gradoII E) (gradoIII Fs) (gradoIV G) (gradoV A) (gradoVI B) (gradoVII Cs))
	(escala (nombre_t A) (modo_t mayor) (gradoI A) (gradoII B) (gradoIII Cs) (gradoIV D) (gradoV E) (gradoVI Fs) (gradoVII Gs))
	(escala (nombre_t E) (modo_t mayor) (gradoI E) (gradoII Fs) (gradoIII Gs) (gradoIV A) (gradoV B) (gradoVI Cs) (gradoVII Ds))
	(escala (nombre_t B) (modo_t mayor) (gradoI B) (gradoII Cs) (gradoIII Ds) (gradoIV E) (gradoV Fs) (gradoVI Gs) (gradoVII As))
	(escala (nombre_t Fs) (modo_t mayor) (gradoI Fs) (gradoII Gs) (gradoIII As) (gradoIV B) (gradoV Cs) (gradoVI Ds) (gradoVII Es))
	(escala (nombre_t Cs) (modo_t mayor) (gradoI Cs) (gradoII Ds) (gradoIII Es) (gradoIV Fs) (gradoV Gs) (gradoVI As) (gradoVII Bs))

	(escala (nombre_t Ab) (modo_t menor) (gradoI Ab) (gradoII Bb) (gradoIII Cb) (gradoIV Db) (gradoV Eb) (gradoVI Fb) (gradoVII G))
	(escala (nombre_t Eb) (modo_t menor) (gradoI Eb) (gradoII F) (gradoIII Gb) (gradoIV Ab) (gradoV Bb) (gradoVI Cb) (gradoVII D))
	(escala (nombre_t Bb) (modo_t menor) (gradoI Bb) (gradoII C) (gradoIII Db) (gradoIV Eb) (gradoV F) (gradoVI Gb) (gradoVII A))
	(escala (nombre_t F) (modo_t menor) (gradoI F) (gradoII G) (gradoIII Ab) (gradoIV Bb) (gradoV C) (gradoVI Db) (gradoVII E))
	(escala (nombre_t C) (modo_t menor) (gradoI C) (gradoII D) (gradoIII Eb) (gradoIV F) (gradoV G) (gradoVI Ab) (gradoVII B))
	(escala (nombre_t G) (modo_t menor) (gradoI G) (gradoII A) (gradoIII Bb) (gradoIV C) (gradoV D) (gradoVI Eb) (gradoVII Fs))
	(escala (nombre_t D) (modo_t menor) (gradoI D) (gradoII E) (gradoIII F) (gradoIV G) (gradoV A) (gradoVI Bb) (gradoVII Cs))
	(escala (nombre_t A) (modo_t menor) (gradoI A) (gradoII B) (gradoIII C) (gradoIV D) (gradoV E) (gradoVI F) (gradoVII Gs))
	(escala (nombre_t E) (modo_t menor) (gradoI E) (gradoII Fs) (gradoIII G) (gradoIV A) (gradoV B) (gradoVI C) (gradoVII Ds))
	(escala (nombre_t B) (modo_t menor) (gradoI B) (gradoII Cs) (gradoIII D) (gradoIV E) (gradoV Fs) (gradoVI Gs) (gradoVII As))
	(escala (nombre_t Fs) (modo_t menor) (gradoI Fs) (gradoII Gs) (gradoIII A) (gradoIV B) (gradoV Cs) (gradoVI D) (gradoVII Es))
	(escala (nombre_t Cs) (modo_t menor) (gradoI Cs) (gradoII Ds) (gradoIII E) (gradoIV Fs) (gradoV Gs) (gradoVI A) (gradoVII Bs))
	(escala (nombre_t Gs) (modo_t menor) (gradoI Gs) (gradoII As) (gradoIII B) (gradoIV Cs) (gradoV Ds) (gradoVI E) (gradoVII Fss))
	(escala (nombre_t Ds) (modo_t menor) (gradoI Ds) (gradoII Es) (gradoIII Fs) (gradoIV Gs) (gradoV As) (gradoVI B) (gradoVII Css))
	(escala (nombre_t As) (modo_t menor) (gradoI As) (gradoII Bs) (gradoIII Cs) (gradoIV Ds) (gradoV Es) (gradoVI Fs) (gradoVII Gss))
) 

;INTERVALOS
(deftemplate intervalo
	(slot distancia)
	(slot tipo)
	(slot nota1)
	(slot nota2)
)

(deffacts intervalos
	(intervalo (distancia 2) (tipo menor) (nota1 C) (nota2 Db))	;Do-Reb
	(intervalo (distancia 2) (tipo menor) (nota1 Cs) (nota2 D))   	;Dos-Re
	(intervalo (distancia 2) (tipo menor) (nota1 Cb) (nota2 Dbb)) 	;Dob-Rebb
	(intervalo (distancia 2) (tipo menor) (nota1 D) (nota2 Eb))   	;Re-Mib
	(intervalo (distancia 2) (tipo menor) (nota1 Ds) (nota2 E))	;Res-Mi
	(intervalo (distancia 2) (tipo menor) (nota1 Db) (nota2 Ebb))	;Reb-Mibb
	(intervalo (distancia 2) (tipo menor) (nota1 E) (nota2 F))	;Mi-Fa
	(intervalo (distancia 2) (tipo menor) (nota1 Es) (nota2 Fs))	;Mis-Fas
	(intervalo (distancia 2) (tipo menor) (nota1 Eb) (nota2 Fb))	;Mib-Fab
	(intervalo (distancia 2) (tipo menor) (nota1 F) (nota2 Gb))	;Fa-Solb
	(intervalo (distancia 2) (tipo menor) (nota1 Fs) (nota2 G))	;Fas-Sol
	(intervalo (distancia 2) (tipo menor) (nota1 Fb) (nota2 Gbb))	;Fab-Solbb
	(intervalo (distancia 2) (tipo menor) (nota1 G) (nota2 Ab))	;Sol-Lab
	(intervalo (distancia 2) (tipo menor) (nota1 Gs) (nota2 A))	;Sols-La
	(intervalo (distancia 2) (tipo menor) (nota1 Gb) (nota2 Abb))	;Solb-Labb
	(intervalo (distancia 2) (tipo menor) (nota1 A) (nota2 Bb))	;La-Sib
	(intervalo (distancia 2) (tipo menor) (nota1 As) (nota2 B))	;Las-Si
	(intervalo (distancia 2) (tipo menor) (nota1 Ab) (nota2 Bbb))	;Lab-Sibb
	(intervalo (distancia 2) (tipo menor) (nota1 B) (nota2 C))	;Si-Do
	(intervalo (distancia 2) (tipo menor) (nota1 Bs) (nota2 Cs))	;Sis-Dos
	(intervalo (distancia 2) (tipo menor) (nota1 Bb) (nota2 Cb))	;Sib-Dob

	(intervalo (distancia 2) (tipo mayor) (nota1 C) (nota2 D))	;Do-Re   
	(intervalo (distancia 2) (tipo mayor) (nota1 Cs) (nota2 Ds))	;Dos-Res
	(intervalo (distancia 2) (tipo mayor) (nota1 Cb) (nota2 Db))  	;Dob-Reb
	(intervalo (distancia 2) (tipo mayor) (nota1 D) (nota2 E))	;Re-Mi
	(intervalo (distancia 2) (tipo mayor) (nota1 Ds) (nota2 Es))	;Res-Mis
	(intervalo (distancia 2) (tipo mayor) (nota1 Db) (nota2 Eb))	;Reb-Mib
	(intervalo (distancia 2) (tipo mayor) (nota1 E) (nota2 Fs))	;Mi-Fas
	(intervalo (distancia 2) (tipo mayor) (nota1 Es) (nota2 Fss)) 	;Mis-Fass
	(intervalo (distancia 2) (tipo mayor) (nota1 Eb) (nota2 F))	;Mib-Fa
	(intervalo (distancia 2) (tipo mayor) (nota1 F) (nota2 G))	;Fa-Sol
	(intervalo (distancia 2) (tipo mayor) (nota1 Fs) (nota2 Gs))	;Fas-Sols
	(intervalo (distancia 2) (tipo mayor) (nota1 Fb) (nota2 Gb))	;Fab-Solb
	(intervalo (distancia 2) (tipo mayor) (nota1 G) (nota2 A))    	;Sol-La
	(intervalo (distancia 2) (tipo mayor) (nota1 Gs) (nota2 As))	;Sols-Las
	(intervalo (distancia 2) (tipo mayor) (nota1 Gb) (nota2 Ab))	;Solb-Lab
	(intervalo (distancia 2) (tipo mayor) (nota1 A) (nota2 B))    	;La-Si
	(intervalo (distancia 2) (tipo mayor) (nota1 As) (nota2 Bs))	;Las-Sis
	(intervalo (distancia 2) (tipo mayor) (nota1 Ab) (nota2 Bb))	;Lab-Sib
	(intervalo (distancia 2) (tipo mayor) (nota1 B) (nota2 Cs))   	;Si-Dos
	(intervalo (distancia 2) (tipo mayor) (nota1 Bs) (nota2 Css))	;Sis-Doss
	(intervalo (distancia 2) (tipo mayor) (nota1 Bb) (nota2 C))	;Sib-Do

	(intervalo (distancia 2) (tipo aumentada) (nota1 C) (nota2 Ds))		;Do-Res   
	(intervalo (distancia 2) (tipo aumentada) (nota1 Cs) (nota2 Dss))	;Dos-Ress
	(intervalo (distancia 2) (tipo aumentada) (nota1 Cb) (nota2 D))		;Dob-Re
	(intervalo (distancia 2) (tipo aumentada) (nota1 D) (nota2 Es))		;Re-Mis
	(intervalo (distancia 2) (tipo aumentada) (nota1 Ds) (nota2 Ess))	;Res-Miss
	(intervalo (distancia 2) (tipo aumentada) (nota1 Db) (nota2 E))		;Reb-Mi
	(intervalo (distancia 2) (tipo aumentada) (nota1 E) (nota2 Fss))	;Mi-Fass
	(intervalo (distancia 2) (tipo aumentada) (nota1 Es) (nota2 Fsss))	;Mis-Fasss
	(intervalo (distancia 2) (tipo aumentada) (nota1 Eb) (nota2 Fs))	;Mib-Fas
	(intervalo (distancia 2) (tipo aumentada) (nota1 F) (nota2 Gs))		;Fa-Sols
	(intervalo (distancia 2) (tipo aumentada) (nota1 Fs) (nota2 Gss))	;Fas-Solss
	(intervalo (distancia 2) (tipo aumentada) (nota1 Fb) (nota2 G))		;Fab-Sol
	(intervalo (distancia 2) (tipo aumentada) (nota1 G) (nota2 As))   	;Sol-Las
	(intervalo (distancia 2) (tipo aumentada) (nota1 Gs) (nota2 Ass))	;Sols-Lass
	(intervalo (distancia 2) (tipo aumentada) (nota1 Gb) (nota2 A))		;Solb-La
	(intervalo (distancia 2) (tipo aumentada) (nota1 A) (nota2 Bs))   	;La-Sis
	(intervalo (distancia 2) (tipo aumentada) (nota1 As) (nota2 Bss))	;Las-Siss
	(intervalo (distancia 2) (tipo aumentada) (nota1 Ab) (nota2 B))		;Lab-Si
	(intervalo (distancia 2) (tipo aumentada) (nota1 B) (nota2 Css))  	;Si-Doss
	(intervalo (distancia 2) (tipo aumentada) (nota1 Bs) (nota2 Csss))	;Sis-Dosss
	(intervalo (distancia 2) (tipo aumentada) (nota1 Bb) (nota2 Cs))	;Sib-Dos

	(intervalo (distancia 3) (tipo menor) (nota1 C) (nota2 Eb))	;Do-Mib   
	(intervalo (distancia 3) (tipo menor) (nota1 Cs) (nota2 E))	;Dos-Mi
	(intervalo (distancia 3) (tipo menor) (nota1 Cb) (nota2 Ebb))	;Dob-Mibb
	(intervalo (distancia 3) (tipo menor) (nota1 D) (nota2 F))	;Re-Fa
	(intervalo (distancia 3) (tipo menor) (nota1 Ds) (nota2 Fs))	;Res-Fas
	(intervalo (distancia 3) (tipo menor) (nota1 Db) (nota2 Fb))	;Reb-Fab
	(intervalo (distancia 3) (tipo menor) (nota1 E) (nota2 G))	;Mi-Sol
	(intervalo (distancia 3) (tipo menor) (nota1 Es) (nota2 Gs))	;Mis-Sols
	(intervalo (distancia 3) (tipo menor) (nota1 Eb) (nota2 Gb))	;Mib-Solb
	(intervalo (distancia 3) (tipo menor) (nota1 F) (nota2 Ab))	;Fa-Lab
	(intervalo (distancia 3) (tipo menor) (nota1 Fs) (nota2 A))	;Fas-La
	(intervalo (distancia 3) (tipo menor) (nota1 Fb) (nota2 Abb))	;Fab-Labb
	(intervalo (distancia 3) (tipo menor) (nota1 G) (nota2 Bb))	;Sol-Sib
	(intervalo (distancia 3) (tipo menor) (nota1 Gs) (nota2 B))	;Sols-Si
	(intervalo (distancia 3) (tipo menor) (nota1 Gb) (nota2 Bbb))	;Solb-Sibb
	(intervalo (distancia 3) (tipo menor) (nota1 A) (nota2 C))	;La-Do
	(intervalo (distancia 3) (tipo menor) (nota1 As) (nota2 Cs))	;Las-Dos
	(intervalo (distancia 3) (tipo menor) (nota1 Ab) (nota2 Cb))	;Lab-Dob
	(intervalo (distancia 3) (tipo menor) (nota1 B) (nota2 D))	;Si-Re
	(intervalo (distancia 3) (tipo menor) (nota1 Bs) (nota2 Ds))	;Sis-Res
	(intervalo (distancia 3) (tipo menor) (nota1 Bb) (nota2 Db))	;Sib-Reb

	(intervalo (distancia 3) (tipo mayor) (nota1 C) (nota2 E))	;Do-Mi   
	(intervalo (distancia 3) (tipo mayor) (nota1 Cs) (nota2 Es))	;Dos-Mis
	(intervalo (distancia 3) (tipo mayor) (nota1 Cb) (nota2 Eb))	;Dob-Mib
	(intervalo (distancia 3) (tipo mayor) (nota1 D) (nota2 Fs))	;Re-Fas
	(intervalo (distancia 3) (tipo mayor) (nota1 Ds) (nota2 Fss))	;Res-Fass
	(intervalo (distancia 3) (tipo mayor) (nota1 Db) (nota2 F))	;Reb-Fa
	(intervalo (distancia 3) (tipo mayor) (nota1 E) (nota2 Gs))	;Mi-Sols
	(intervalo (distancia 3) (tipo mayor) (nota1 Es) (nota2 Gss))	;Mis-Solss
	(intervalo (distancia 3) (tipo mayor) (nota1 Eb) (nota2 G))	;Mib-Sol
	(intervalo (distancia 3) (tipo mayor) (nota1 F) (nota2 A))	;Fa-La
	(intervalo (distancia 3) (tipo mayor) (nota1 Fs) (nota2 As))	;Fas-Las
	(intervalo (distancia 3) (tipo mayor) (nota1 Fb) (nota2 Ab))	;Fab-Lab
	(intervalo (distancia 3) (tipo mayor) (nota1 G) (nota2 B))	;Sol-Si
	(intervalo (distancia 3) (tipo mayor) (nota1 Gs) (nota2 Bs))	;Sols-Sis
	(intervalo (distancia 3) (tipo mayor) (nota1 Gb) (nota2 Bb))	;Solb-Sib
	(intervalo (distancia 3) (tipo mayor) (nota1 A) (nota2 Cs))	;La-Dos
	(intervalo (distancia 3) (tipo mayor) (nota1 As) (nota2 Css))	;Las-Doss
	(intervalo (distancia 3) (tipo mayor) (nota1 Ab) (nota2 C))	;Lab-Do
	(intervalo (distancia 3) (tipo mayor) (nota1 B) (nota2 Ds))	;Si-Res
	(intervalo (distancia 3) (tipo mayor) (nota1 Bs) (nota2 Dss))	;Sis-Ress
	(intervalo (distancia 3) (tipo mayor) (nota1 Bb) (nota2 D))	;Sib-Re

	(intervalo (distancia 3) (tipo aumentada) (nota1 C) (nota2 Es))		;Do-Mis   
	(intervalo (distancia 3) (tipo aumentada) (nota1 Cs) (nota2 Ess))	;Dos-Miss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Cb) (nota2 E))		;Dob-Mi
	(intervalo (distancia 3) (tipo aumentada) (nota1 D) (nota2 Fss))	;Re-Fass
	(intervalo (distancia 3) (tipo aumentada) (nota1 Ds) (nota2 Fsss))	;Res-Fasss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Db) (nota2 Fs))	;Reb-Fas
	(intervalo (distancia 3) (tipo aumentada) (nota1 E) (nota2 Gss))	;Mi-Solss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Es) (nota2 Gsss))	;Mis-Solsss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Eb) (nota2 Gs))	;Mib-Sols
	(intervalo (distancia 3) (tipo aumentada) (nota1 F) (nota2 As))		;Fa-Las
	(intervalo (distancia 3) (tipo aumentada) (nota1 Fs) (nota2 Ass))	;Fas-Lass
	(intervalo (distancia 3) (tipo aumentada) (nota1 Fb) (nota2 A))		;Fab-La
	(intervalo (distancia 3) (tipo aumentada) (nota1 G) (nota2 Bs))		;Sol-Sis
	(intervalo (distancia 3) (tipo aumentada) (nota1 Gs) (nota2 Bss))	;Sols-Siss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Gb) (nota2 B))		;Solb-Si
	(intervalo (distancia 3) (tipo aumentada) (nota1 A) (nota2 Css))	;La-Doss
	(intervalo (distancia 3) (tipo aumentada) (nota1 As) (nota2 Csss))	;Las-Dosss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Ab) (nota2 Cs))	;Lab-Dos
	(intervalo (distancia 3) (tipo aumentada) (nota1 B) (nota2 Dss))	;Si-Ress
	(intervalo (distancia 3) (tipo aumentada) (nota1 Bs) (nota2 Dsss))	;Sis-Resss
	(intervalo (distancia 3) (tipo aumentada) (nota1 Bb) (nota2 Ds))	;Sib-Res

	(intervalo (distancia 4) (tipo justa) (nota1 C) (nota2 F))	;Do-Fa   
	(intervalo (distancia 4) (tipo justa) (nota1 Cs) (nota2 Fs))	;Dos-Fas
	(intervalo (distancia 4) (tipo justa) (nota1 Cb) (nota2 Fb))	;Dob-Fab
	(intervalo (distancia 4) (tipo justa) (nota1 D) (nota2 G))	;Re-Sol
	(intervalo (distancia 4) (tipo justa) (nota1 Ds) (nota2 Gs))	;Res-Sols
	(intervalo (distancia 4) (tipo justa) (nota1 Db) (nota2 Gb))	;Reb-Solb
	(intervalo (distancia 4) (tipo justa) (nota1 E) (nota2 A))	;Mi-La
	(intervalo (distancia 4) (tipo justa) (nota1 Es) (nota2 As))	;Mis-Las
	(intervalo (distancia 4) (tipo justa) (nota1 Eb) (nota2 Ab))	;Mib-Lab
	(intervalo (distancia 4) (tipo justa) (nota1 F) (nota2 Bb))	;Fa-Sib
	(intervalo (distancia 4) (tipo justa) (nota1 Fs) (nota2 B))	;Fas-Si
	(intervalo (distancia 4) (tipo justa) (nota1 Fb) (nota2 Bbb))	;Fab-Sibb
	(intervalo (distancia 4) (tipo justa) (nota1 G) (nota2 C))	;Sol-Do
	(intervalo (distancia 4) (tipo justa) (nota1 Gs) (nota2 Cs))	;Sols-Dos
	(intervalo (distancia 4) (tipo justa) (nota1 Gb) (nota2 Cb))	;Solb-Dob
	(intervalo (distancia 4) (tipo justa) (nota1 A) (nota2 D))	;La-Re
	(intervalo (distancia 4) (tipo justa) (nota1 As) (nota2 Ds))	;Las-Res
	(intervalo (distancia 4) (tipo justa) (nota1 Ab) (nota2 Db))	;Lab-Reb
	(intervalo (distancia 4) (tipo justa) (nota1 B) (nota2 E))	;Si-Mi
	(intervalo (distancia 4) (tipo justa) (nota1 Bs) (nota2 Es))	;Sis-Mis
	(intervalo (distancia 4) (tipo justa) (nota1 Bb) (nota2 Eb))	;Sib-Mib

	(intervalo (distancia 4) (tipo disminuida) (nota1 C) (nota2 Fb))	;Do-Fab   
	(intervalo (distancia 4) (tipo disminuida) (nota1 Cs) (nota2 F))	;Dos-Fa
	(intervalo (distancia 4) (tipo disminuida) (nota1 Cb) (nota2 Fbb))	;Dob-Fabb
	(intervalo (distancia 4) (tipo disminuida) (nota1 D) (nota2 Gb))	;Re-Solb
	(intervalo (distancia 4) (tipo disminuida) (nota1 Ds) (nota2 G))	;Res-Sol
	(intervalo (distancia 4) (tipo disminuida) (nota1 Db) (nota2 Gbb))	;Reb-Solbb
	(intervalo (distancia 4) (tipo disminuida) (nota1 E) (nota2 Ab))	;Mi-Lab
	(intervalo (distancia 4) (tipo disminuida) (nota1 Es) (nota2 A))	;Mis-La
	(intervalo (distancia 4) (tipo disminuida) (nota1 Eb) (nota2 Abb))	;Mib-Labb
	(intervalo (distancia 4) (tipo disminuida) (nota1 F) (nota2 Bbb))	;Fa-Sibb
	(intervalo (distancia 4) (tipo disminuida) (nota1 Fs) (nota2 Bb))	;Fas-Sib
	(intervalo (distancia 4) (tipo disminuida) (nota1 Fb) (nota2 Bbbb))	;Fab-Sibbb
	(intervalo (distancia 4) (tipo disminuida) (nota1 G) (nota2 Cb))	;Sol-Dob
	(intervalo (distancia 4) (tipo disminuida) (nota1 Gs) (nota2 C))	;Sols-Do
	(intervalo (distancia 4) (tipo disminuida) (nota1 Gb) (nota2 Cbb))	;Solb-Dobb
	(intervalo (distancia 4) (tipo disminuida) (nota1 A) (nota2 Db))	;La-Reb
	(intervalo (distancia 4) (tipo disminuida) (nota1 As) (nota2 D))	;Las-Re
	(intervalo (distancia 4) (tipo disminuida) (nota1 Ab) (nota2 Dbb))	;Lab-Rebb
	(intervalo (distancia 4) (tipo disminuida) (nota1 B) (nota2 Eb))	;Si-Mib
	(intervalo (distancia 4) (tipo disminuida) (nota1 Bs) (nota2 E))	;Sis-Mi
	(intervalo (distancia 4) (tipo disminuida) (nota1 Bb) (nota2 Ebb))	;Sib-Mibb

	(intervalo (distancia 4) (tipo aumentada) (nota1 C) (nota2 Fs))		;Do-Fas   
	(intervalo (distancia 4) (tipo aumentada) (nota1 Cs) (nota2 Fss))	;Dos-Fass
	(intervalo (distancia 4) (tipo aumentada) (nota1 Cb) (nota2 F))		;Dob-Fa
	(intervalo (distancia 4) (tipo aumentada) (nota1 D) (nota2 Gs))		;Re-Sols
	(intervalo (distancia 4) (tipo aumentada) (nota1 Ds) (nota2 Gss))	;Res-Solss
	(intervalo (distancia 4) (tipo aumentada) (nota1 Db) (nota2 G))		;Reb-Sol
	(intervalo (distancia 4) (tipo aumentada) (nota1 E) (nota2 As))		;Mi-Las
	(intervalo (distancia 4) (tipo aumentada) (nota1 Es) (nota2 Ass))	;Mis-Lass
	(intervalo (distancia 4) (tipo aumentada) (nota1 Eb) (nota2 A))		;Mib-La
	(intervalo (distancia 4) (tipo aumentada) (nota1 F) (nota2 B))		;Fa-Si
	(intervalo (distancia 4) (tipo aumentada) (nota1 Fs) (nota2 Bs))	;Fas-Sis
	(intervalo (distancia 4) (tipo aumentada) (nota1 Fb) (nota2 Bb))	;Fab-Sib
	(intervalo (distancia 4) (tipo aumentada) (nota1 G) (nota2 Cs))		;Sol-Dos
	(intervalo (distancia 4) (tipo aumentada) (nota1 Gs) (nota2 Css))	;Sols-Doss
	(intervalo (distancia 4) (tipo aumentada) (nota1 Gb) (nota2 C))		;Solb-Do
	(intervalo (distancia 4) (tipo aumentada) (nota1 A) (nota2 Ds))		;La-Res
	(intervalo (distancia 4) (tipo aumentada) (nota1 As) (nota2 Dss))	;Las-Ress
	(intervalo (distancia 4) (tipo aumentada) (nota1 Ab) (nota2 D))		;Lab-Re
	(intervalo (distancia 4) (tipo aumentada) (nota1 B) (nota2 Es))		;Si-Mis
	(intervalo (distancia 4) (tipo aumentada) (nota1 Bs) (nota2 Ess))	;Sis-Miss
	(intervalo (distancia 4) (tipo aumentada) (nota1 Bb) (nota2 E))		;Sib-Mi

	(intervalo (distancia 5) (tipo justa) (nota1 C) (nota2 G))	;Do-Sol   
	(intervalo (distancia 5) (tipo justa) (nota1 Cs) (nota2 Gs))	;Dos-Sols
	(intervalo (distancia 5) (tipo justa) (nota1 Cb) (nota2 Gb))	;Dob-Solb
	(intervalo (distancia 5) (tipo justa) (nota1 D) (nota2 A))	;Re-La
	(intervalo (distancia 5) (tipo justa) (nota1 Ds) (nota2 As))	;Res-Las
	(intervalo (distancia 5) (tipo justa) (nota1 Db) (nota2 Ab))	;Reb-Lab
	(intervalo (distancia 5) (tipo justa) (nota1 E) (nota2 B))	;Mi-Si
	(intervalo (distancia 5) (tipo justa) (nota1 Es) (nota2 Bs))	;Mis-Sis
	(intervalo (distancia 5) (tipo justa) (nota1 Eb) (nota2 Bb))	;Mib-Sib
	(intervalo (distancia 5) (tipo justa) (nota1 F) (nota2 C))	;Fa-Do
	(intervalo (distancia 5) (tipo justa) (nota1 Fs) (nota2 Cs))	;Fas-Dos
	(intervalo (distancia 5) (tipo justa) (nota1 Fb) (nota2 Cb))	;Fab-Dob
	(intervalo (distancia 5) (tipo justa) (nota1 G) (nota2 D))	;Sol-Re
	(intervalo (distancia 5) (tipo justa) (nota1 Gs) (nota2 Ds))	;Sols-Res
	(intervalo (distancia 5) (tipo justa) (nota1 Gb) (nota2 Db))	;Solb-Reb
	(intervalo (distancia 5) (tipo justa) (nota1 A) (nota2 E))	;La-Mi
	(intervalo (distancia 5) (tipo justa) (nota1 As) (nota2 Es))	;Las-Mis
	(intervalo (distancia 5) (tipo justa) (nota1 Ab) (nota2 Eb))	;Lab-Mib
	(intervalo (distancia 5) (tipo justa) (nota1 B) (nota2 Fs))	;Si-Fas
	(intervalo (distancia 5) (tipo justa) (nota1 Bs) (nota2 Fss))	;Sis-Fass
	(intervalo (distancia 5) (tipo justa) (nota1 Bb) (nota2 F))	;Sib-Fa

	(intervalo (distancia 5) (tipo disminuida) (nota1 C) (nota2 Gb))	;Do-Solb   
	(intervalo (distancia 5) (tipo disminuida) (nota1 Cs) (nota2 G))	;Dos-Sol
	(intervalo (distancia 5) (tipo disminuida) (nota1 Cb) (nota2 Gbb))	;Dob-Solbb
	(intervalo (distancia 5) (tipo disminuida) (nota1 D) (nota2 Ab))	;Re-Lab
	(intervalo (distancia 5) (tipo disminuida) (nota1 Ds) (nota2 A))	;Res-La
	(intervalo (distancia 5) (tipo disminuida) (nota1 Db) (nota2 Abb))	;Reb-Labb
	(intervalo (distancia 5) (tipo disminuida) (nota1 E) (nota2 Bb))	;Mi-Sib
	(intervalo (distancia 5) (tipo disminuida) (nota1 Es) (nota2 B))	;Mis-Si
	(intervalo (distancia 5) (tipo disminuida) (nota1 Eb) (nota2 Bbb))	;Mib-Sibb
	(intervalo (distancia 5) (tipo disminuida) (nota1 F) (nota2 Cb))	;Fa-Dob
	(intervalo (distancia 5) (tipo disminuida) (nota1 Fs) (nota2 C))	;Fas-Do
	(intervalo (distancia 5) (tipo disminuida) (nota1 Fb) (nota2 Cbb))	;Fab-Dobb
	(intervalo (distancia 5) (tipo disminuida) (nota1 G) (nota2 Db))	;Sol-Reb
	(intervalo (distancia 5) (tipo disminuida) (nota1 Gs) (nota2 D))	;Sols-Re
	(intervalo (distancia 5) (tipo disminuida) (nota1 Gb) (nota2 Dbb))	;Solb-Rebb
	(intervalo (distancia 5) (tipo disminuida) (nota1 A) (nota2 Eb))	;La-Mib
	(intervalo (distancia 5) (tipo disminuida) (nota1 As) (nota2 E))	;Las-Mi
	(intervalo (distancia 5) (tipo disminuida) (nota1 Ab) (nota2 Ebb))	;Lab-Mibb
	(intervalo (distancia 5) (tipo disminuida) (nota1 B) (nota2 F))		;Si-Fa
	(intervalo (distancia 5) (tipo disminuida) (nota1 Bs) (nota2 Fs))	;Sis-Fas
	(intervalo (distancia 5) (tipo disminuida) (nota1 Bb) (nota2 Fb))	;Sib-Fab

	(intervalo (distancia 5) (tipo aumentada) (nota1 C) (nota2 Gs))		;Do-Sols   
	(intervalo (distancia 5) (tipo aumentada) (nota1 Cs) (nota2 Gss))	;Dos-Solss
	(intervalo (distancia 5) (tipo aumentada) (nota1 Cb) (nota2 G))		;Dob-Sol
	(intervalo (distancia 5) (tipo aumentada) (nota1 D) (nota2 As))		;Re-Las
	(intervalo (distancia 5) (tipo aumentada) (nota1 Ds) (nota2 Ass))	;Res-Lass
	(intervalo (distancia 5) (tipo aumentada) (nota1 Db) (nota2 A))		;Reb-La
	(intervalo (distancia 5) (tipo aumentada) (nota1 E) (nota2 Bs))		;Mi-Sis
	(intervalo (distancia 5) (tipo aumentada) (nota1 Es) (nota2 Bss))	;Mis-Siss
	(intervalo (distancia 5) (tipo aumentada) (nota1 Eb) (nota2 B))		;Mib-Si
	(intervalo (distancia 5) (tipo aumentada) (nota1 F) (nota2 Cs))		;Fa-Dos
	(intervalo (distancia 5) (tipo aumentada) (nota1 Fs) (nota2 Css))	;Fas-Doss
	(intervalo (distancia 5) (tipo aumentada) (nota1 Fb) (nota2 C))		;Fab-Do
	(intervalo (distancia 5) (tipo aumentada) (nota1 G) (nota2 Ds))		;Sol-Res
	(intervalo (distancia 5) (tipo aumentada) (nota1 Gs) (nota2 Dss))	;Sols-Ress
	(intervalo (distancia 5) (tipo aumentada) (nota1 Gb) (nota2 D))		;Solb-Re
	(intervalo (distancia 5) (tipo aumentada) (nota1 A) (nota2 Es))		;La-Mis
	(intervalo (distancia 5) (tipo aumentada) (nota1 As) (nota2 Ess))	;Las-Miss
	(intervalo (distancia 5) (tipo aumentada) (nota1 Ab) (nota2 E))		;Lab-Mi
	(intervalo (distancia 5) (tipo aumentada) (nota1 B) (nota2 Fss))	;Si-Fass
	(intervalo (distancia 5) (tipo aumentada) (nota1 Bs) (nota2 Fsss))	;Sis-Fasss
	(intervalo (distancia 5) (tipo aumentada) (nota1 Bb) (nota2 Fs))	;Sib-Fas

	(intervalo (distancia 6) (tipo menor) (nota1 C) (nota2 Ab))	;Do-Lab   
	(intervalo (distancia 6) (tipo menor) (nota1 Cs) (nota2 A))	;Dos-La
	(intervalo (distancia 6) (tipo menor) (nota1 Cb) (nota2 Abb))	;Dob-Labb
	(intervalo (distancia 6) (tipo menor) (nota1 D) (nota2 Bb))	;Re-Sib
	(intervalo (distancia 6) (tipo menor) (nota1 Ds) (nota2 B))	;Res-Si
	(intervalo (distancia 6) (tipo menor) (nota1 Db) (nota2 Bbb))	;Reb-Sibb
	(intervalo (distancia 6) (tipo menor) (nota1 E) (nota2 C))	;Mi-Do
	(intervalo (distancia 6) (tipo menor) (nota1 Es) (nota2 Cs))	;Mis-Dos
	(intervalo (distancia 6) (tipo menor) (nota1 Eb) (nota2 Cb))	;Mib-Dob
	(intervalo (distancia 6) (tipo menor) (nota1 F) (nota2 Db))	;Fa-Reb
	(intervalo (distancia 6) (tipo menor) (nota1 Fs) (nota2 D))	;Fas-Re
	(intervalo (distancia 6) (tipo menor) (nota1 Fb) (nota2 Dbb))	;Fab-Rebb
	(intervalo (distancia 6) (tipo menor) (nota1 G) (nota2 Eb))	;Sol-Mib
	(intervalo (distancia 6) (tipo menor) (nota1 Gs) (nota2 E))	;Sols-Mi
	(intervalo (distancia 6) (tipo menor) (nota1 Gb) (nota2 Ebb))	;Solb-Mibb
	(intervalo (distancia 6) (tipo menor) (nota1 A) (nota2 F))	;La-Fa
	(intervalo (distancia 6) (tipo menor) (nota1 As) (nota2 Fs))	;Las-Fas
	(intervalo (distancia 6) (tipo menor) (nota1 Ab) (nota2 Fb))	;Lab-Fab
	(intervalo (distancia 6) (tipo menor) (nota1 B) (nota2 G))	;Si-Sol
	(intervalo (distancia 6) (tipo menor) (nota1 Bs) (nota2 Gs))	;Sis-Sols
	(intervalo (distancia 6) (tipo menor) (nota1 Bb) (nota2 Gb))	;Sib-Solb

	(intervalo (distancia 6) (tipo mayor) (nota1 C) (nota2 A))	;Do-La   
	(intervalo (distancia 6) (tipo mayor) (nota1 Cs) (nota2 As))	;Dos-Las
	(intervalo (distancia 6) (tipo mayor) (nota1 Cb) (nota2 Ab))	;Dob-Lab
	(intervalo (distancia 6) (tipo mayor) (nota1 D) (nota2 B))	;Re-Si
	(intervalo (distancia 6) (tipo mayor) (nota1 Ds) (nota2 Bs))	;Res-Sis
	(intervalo (distancia 6) (tipo mayor) (nota1 Db) (nota2 Bb))	;Reb-Sib
	(intervalo (distancia 6) (tipo mayor) (nota1 E) (nota2 Cs))	;Mi-Dos
	(intervalo (distancia 6) (tipo mayor) (nota1 Es) (nota2 Css))	;Mis-Doss
	(intervalo (distancia 6) (tipo mayor) (nota1 Eb) (nota2 C))	;Mib-Do
	(intervalo (distancia 6) (tipo mayor) (nota1 F) (nota2 D))	;Fa-Re
	(intervalo (distancia 6) (tipo mayor) (nota1 Fs) (nota2 Ds))	;Fas-Res
	(intervalo (distancia 6) (tipo mayor) (nota1 Fb) (nota2 Db))	;Fab-Reb
	(intervalo (distancia 6) (tipo mayor) (nota1 G) (nota2 E))	;Sol-Mi
	(intervalo (distancia 6) (tipo mayor) (nota1 Gs) (nota2 Es))	;Sols-Mis
	(intervalo (distancia 6) (tipo mayor) (nota1 Gb) (nota2 Eb))	;Solb-Mib
	(intervalo (distancia 6) (tipo mayor) (nota1 A) (nota2 Fs))	;La-Fas
	(intervalo (distancia 6) (tipo mayor) (nota1 As) (nota2 Fss))	;Las-Fass
	(intervalo (distancia 6) (tipo mayor) (nota1 Ab) (nota2 F))	;Lab-Fa
	(intervalo (distancia 6) (tipo mayor) (nota1 B) (nota2 Gs))	;Si-Sols
	(intervalo (distancia 6) (tipo mayor) (nota1 Bs) (nota2 Gss))	;Sis-Solss
	(intervalo (distancia 6) (tipo mayor) (nota1 Bb) (nota2 G))	;Sib-Sol

	(intervalo (distancia 6) (tipo aumentada) (nota1 C) (nota2 As))		;Do-Las   
	(intervalo (distancia 6) (tipo aumentada) (nota1 Cs) (nota2 Ass))	;Dos-Lass
	(intervalo (distancia 6) (tipo aumentada) (nota1 Cb) (nota2 A))		;Dob-La
	(intervalo (distancia 6) (tipo aumentada) (nota1 D) (nota2 Bs))		;Re-Sis
	(intervalo (distancia 6) (tipo aumentada) (nota1 Ds) (nota2 Bss))	;Res-Siss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Db) (nota2 B))		;Reb-Si
	(intervalo (distancia 6) (tipo aumentada) (nota1 E) (nota2 Css))	;Mi-Doss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Es) (nota2 Csss))	;Mis-Dosss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Eb) (nota2 Cs))	;Mib-Dos
	(intervalo (distancia 6) (tipo aumentada) (nota1 F) (nota2 Ds))		;Fa-Res
	(intervalo (distancia 6) (tipo aumentada) (nota1 Fs) (nota2 Dss))	;Fas-Ress
	(intervalo (distancia 6) (tipo aumentada) (nota1 Fb) (nota2 D))		;Fab-Re
	(intervalo (distancia 6) (tipo aumentada) (nota1 G) (nota2 Es))		;Sol-Mis
	(intervalo (distancia 6) (tipo aumentada) (nota1 Gs) (nota2 Ess))	;Sols-Miss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Gb) (nota2 E))		;Solb-Mi
	(intervalo (distancia 6) (tipo aumentada) (nota1 A) (nota2 Fss))	;La-Fass
	(intervalo (distancia 6) (tipo aumentada) (nota1 As) (nota2 Fsss))	;Las-Fasss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Ab) (nota2 Fs))	;Lab-Fas
	(intervalo (distancia 6) (tipo aumentada) (nota1 B) (nota2 Gss))	;Si-Solss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Bs) (nota2 Gsss))	;Sis-Solsss
	(intervalo (distancia 6) (tipo aumentada) (nota1 Bb) (nota2 Gs))	;Sib-Sols

	(intervalo (distancia 7) (tipo menor) (nota1 C) (nota2 Bb))	;Do-Sib   
	(intervalo (distancia 7) (tipo menor) (nota1 Cs) (nota2 B))	;Dos-Si
	(intervalo (distancia 7) (tipo menor) (nota1 Cb) (nota2 Bbb))	;Dob-Sibb
	(intervalo (distancia 7) (tipo menor) (nota1 D) (nota2 C))	;Re-Do
	(intervalo (distancia 7) (tipo menor) (nota1 Ds) (nota2 Cs))	;Res-Dos
	(intervalo (distancia 7) (tipo menor) (nota1 Db) (nota2 Cb))	;Reb-Dob
	(intervalo (distancia 7) (tipo menor) (nota1 E) (nota2 D))	;Mi-Re
	(intervalo (distancia 7) (tipo menor) (nota1 Es) (nota2 Ds))	;Mis-Res
	(intervalo (distancia 7) (tipo menor) (nota1 Eb) (nota2 Db))	;Mib-Reb
	(intervalo (distancia 7) (tipo menor) (nota1 F) (nota2 Eb))	;Fa-Mib
	(intervalo (distancia 7) (tipo menor) (nota1 Fs) (nota2 E))	;Fas-Mi
	(intervalo (distancia 7) (tipo menor) (nota1 Fb) (nota2 Ebb))	;Fab-Mibb
	(intervalo (distancia 7) (tipo menor) (nota1 G) (nota2 F))	;Sol-Fa
	(intervalo (distancia 7) (tipo menor) (nota1 Gs) (nota2 Fs))	;Sols-Fas
	(intervalo (distancia 7) (tipo menor) (nota1 Gb) (nota2 Fb))	;Solb-Fab
	(intervalo (distancia 7) (tipo menor) (nota1 A) (nota2 G))	;La-Sol
	(intervalo (distancia 7) (tipo menor) (nota1 As) (nota2 Gs))	;Las-Sols
	(intervalo (distancia 7) (tipo menor) (nota1 Ab) (nota2 Gb))	;Lab-Solb
	(intervalo (distancia 7) (tipo menor) (nota1 B) (nota2 A))	;Si-La
	(intervalo (distancia 7) (tipo menor) (nota1 Bs) (nota2 As))	;Sis-Las
	(intervalo (distancia 7) (tipo menor) (nota1 Bb) (nota2 Ab))	;Sib-Lab

	(intervalo (distancia 7) (tipo mayor) (nota1 C) (nota2 B))	;Do-Si   
	(intervalo (distancia 7) (tipo mayor) (nota1 Cs) (nota2 Bs))	;Dos-Sis
	(intervalo (distancia 7) (tipo mayor) (nota1 Cb) (nota2 Bb))	;Dob-Sib
	(intervalo (distancia 7) (tipo mayor) (nota1 D) (nota2 Cs))	;Re-Dos
	(intervalo (distancia 7) (tipo mayor) (nota1 Ds) (nota2 Css))	;Res-Doss
	(intervalo (distancia 7) (tipo mayor) (nota1 Db) (nota2 C))	;Reb-Do
	(intervalo (distancia 7) (tipo mayor) (nota1 E) (nota2 Ds))	;Mi-Res
	(intervalo (distancia 7) (tipo mayor) (nota1 Es) (nota2 Dss))	;Mis-Ress
	(intervalo (distancia 7) (tipo mayor) (nota1 Eb) (nota2 D))	;Mib-Re
	(intervalo (distancia 7) (tipo mayor) (nota1 F) (nota2 E))	;Fa-Mi
	(intervalo (distancia 7) (tipo mayor) (nota1 Fs) (nota2 Es))	;Fas-Mis 
	(intervalo (distancia 7) (tipo mayor) (nota1 Fb) (nota2 Eb))	;Fab-Mib
	(intervalo (distancia 7) (tipo mayor) (nota1 G) (nota2 Fs))	;Sol-Fas
	(intervalo (distancia 7) (tipo mayor) (nota1 Gs) (nota2 Fss))	;Sols-Fass
	(intervalo (distancia 7) (tipo mayor) (nota1 Gb) (nota2 F))	;Solb-Fa
	(intervalo (distancia 7) (tipo mayor) (nota1 A) (nota2 Gs))	;La-Sols
	(intervalo (distancia 7) (tipo mayor) (nota1 As) (nota2 Gss))	;Las-Solss
	(intervalo (distancia 7) (tipo mayor) (nota1 Ab) (nota2 G))	;Lab-Sol
	(intervalo (distancia 7) (tipo mayor) (nota1 B) (nota2 As))	;Si-Las
	(intervalo (distancia 7) (tipo mayor) (nota1 Bs) (nota2 Ass))	;Sis-Lass
	(intervalo (distancia 7) (tipo mayor) (nota1 Bb) (nota2 A))	;Sib-La

	(intervalo (distancia 8) (tipo justa) (nota1 C) (nota2 C))	;Do-Do   
	(intervalo (distancia 8) (tipo justa) (nota1 Cs) (nota2 Cs))	;Dos-Dos
	(intervalo (distancia 8) (tipo justa) (nota1 Cb) (nota2 Cb))	;Dob-Dob
	(intervalo (distancia 8) (tipo justa) (nota1 D) (nota2 D))	;Re-Re
	(intervalo (distancia 8) (tipo justa) (nota1 Ds) (nota2 Ds))	;Res-Res
	(intervalo (distancia 8) (tipo justa) (nota1 Db) (nota2 Db))	;Reb-Reb
	(intervalo (distancia 8) (tipo justa) (nota1 E) (nota2 E))	;Mi-Mi
	(intervalo (distancia 8) (tipo justa) (nota1 Es) (nota2 Es))	;Mis-Mis
	(intervalo (distancia 8) (tipo justa) (nota1 Eb) (nota2 Eb))	;Mib-Mib
	(intervalo (distancia 8) (tipo justa) (nota1 F) (nota2 F))	;Fa-Fa
	(intervalo (distancia 8) (tipo justa) (nota1 Fs) (nota2 Fs))	;Fas-Fas
	(intervalo (distancia 8) (tipo justa) (nota1 Fb) (nota2 Fb))	;Fab-Fab
	(intervalo (distancia 8) (tipo justa) (nota1 G) (nota2 G))	;Sol-Sol
	(intervalo (distancia 8) (tipo justa) (nota1 Gs) (nota2 Gs))	;Sols-Sols
	(intervalo (distancia 8) (tipo justa) (nota1 Gb) (nota2 Gb))	;Solb-Solb
	(intervalo (distancia 8) (tipo justa) (nota1 A) (nota2 A))	;La-La
	(intervalo (distancia 8) (tipo justa) (nota1 As) (nota2 As))	;Las-Las
	(intervalo (distancia 8) (tipo justa) (nota1 Ab) (nota2 Ab))	;Lab-Lab
	(intervalo (distancia 8) (tipo justa) (nota1 B) (nota2 B))	;Si-Si
	(intervalo (distancia 8) (tipo justa) (nota1 Bs) (nota2 Bs))	;Sis-Sis
	(intervalo (distancia 8) (tipo justa) (nota1 Bb) (nota2 Bb))	;Sib-Sib
)

(deftemplate intervalo_consonante
	(slot distancia)
	(slot tipo)
)

(deftemplate intervalo_disonante
	(slot distancia)
	(slot tipo)
)

(deffacts intervalos_consonantes

	(intervalo_consonante (distancia 3) (tipo mayor))
	(intervalo_consonante (distancia 3) (tipo menor))
	(intervalo_consonante (distancia 4) (tipo justa))
	(intervalo_consonante (distancia 5) (tipo justa))
	(intervalo_consonante (distancia 6) (tipo mayor))
	(intervalo_consonante (distancia 6) (tipo menor))
	(intervalo_consonante (distancia 8) (tipo justa))
)

(deffacts intervalos_disonantes

	(intervalo_disonante (distancia 2) (tipo mayor))
	(intervalo_disonante (distancia 2) (tipo menor))
	(intervalo_disonante (distancia 4) (tipo aumentada))
	(intervalo_disonante (distancia 5) (tipo disminuida))
	(intervalo_disonante (distancia 7) (tipo mayor))
	(intervalo_disonante (distancia 7) (tipo menor))
)

;SUCESIONES LOGICA
(deftemplate sucesionLogica

	(slot acorde1)
	(slot acorde2)
)

(deffacts sucesionesLogicas

	(sucesionLogica (acorde1 II) (acorde2 I))
	(sucesionLogica (acorde1 II) (acorde2 IV))
	(sucesionLogica (acorde1 II) (acorde2 V))
	(sucesionLogica (acorde1 II) (acorde2 VII))
	(sucesionLogica (acorde1 III) (acorde2 VI))
	(sucesionLogica (acorde1 IV) (acorde2 I))
	(sucesionLogica (acorde1 IV) (acorde2 II))
	(sucesionLogica (acorde1 IV) (acorde2 V))
	(sucesionLogica (acorde1 IV) (acorde2 VII))
	(sucesionLogica (acorde1 V) (acorde2 I))
	(sucesionLogica (acorde1 V) (acorde2 VI))
	(sucesionLogica (acorde1 V) (acorde2 VII))
	(sucesionLogica (acorde1 VI) (acorde2 II))
	(sucesionLogica (acorde1 VI) (acorde2 IV))
	(sucesionLogica (acorde1 VII) (acorde2 I))
	(sucesionLogica (acorde1 VII) (acorde2 III))
	(sucesionLogica (acorde1 VII) (acorde2 V))
)

(deffacts saltos

	(saltoPequeño 2)
	(saltoPequeño 3)
	(saltoPequeño 4)
	(saltoGrande 5)
	(saltoGrande 6)
	(saltoGrande 7)
	(saltoGrande 8)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;			HECHOS DEDUCIDOS		      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Hechos deducidos de los anteriores

;ACORDES TRÍADA
(deftemplate acorde_3
	(slot grado)
	(slot nombre_tonalidad)
	(slot modo_tonalidad)
	(slot fundamental)
	(slot tercera)
	(slot quinta)
)

; Regla para asertar todos los acordes de tríada de todas las tonalidades
(defrule acordes_triada
	(declare (salience 5))
	(escala (nombre_t ?nt) (modo_t ?mt) (gradoI ?g1) (gradoII ?g2) (gradoIII ?g3) (gradoIV ?g4) (gradoV ?g5) (gradoVI ?g6) (gradoVII ?g7))
	=>
	(assert (acorde_3 (grado I) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g1) (tercera ?g3) (quinta ?g5)))
	(assert (acorde_3 (grado II) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g2) (tercera ?g4) (quinta ?g6)))
	(assert (acorde_3 (grado III) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g3) (tercera ?g5) (quinta ?g7)))
	(assert (acorde_3 (grado IV) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g4) (tercera ?g6) (quinta ?g1)))
	(assert (acorde_3 (grado V) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g5) (tercera ?g7) (quinta ?g2)))
	(assert (acorde_3 (grado VI) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g6) (tercera ?g1) (quinta ?g3)))
	(assert (acorde_3 (grado VII) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g7) (tercera ?g2) (quinta ?g4)))
)

;ACORDES CUATRÍADA
(deftemplate acorde_4
	(slot grado)
	(slot nombre_tonalidad)
	(slot modo_tonalidad)
	(slot fundamental)
	(slot tercera)
	(slot quinta)
	(slot septima)
)

; Regla para asertar todos los acordes de cuatríada de todas las tonalidades (incluídos los acordes de séptima de dominante)
(defrule acordes_cuatriada
	(declare (salience 5))
	(escala (nombre_t ?nt) (modo_t ?mt) (gradoI ?g1) (gradoII ?g2) (gradoIII ?g3) (gradoIV ?g4) (gradoV ?g5) (gradoVI ?g6) (gradoVII ?g7))
	=>
	(assert (acorde_4 (grado I) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g1) (tercera ?g3) (quinta ?g5) (septima ?g7)))
	(assert (acorde_4 (grado II) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g2) (tercera ?g4) (quinta ?g6) (septima ?g1)))
	(assert (acorde_4 (grado III) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g3) (tercera ?g5) (quinta ?g7) (septima ?g2)))
	(assert (acorde_4 (grado IV) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g4) (tercera ?g6) (quinta ?g1) (septima ?g3)))
	(assert (acorde_4 (grado V) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g5) (tercera ?g7) (quinta ?g2) (septima ?g4)))
	(assert (acorde_4 (grado VI) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g6) (tercera ?g1) (quinta ?g3) (septima ?g5)))
	(assert (acorde_4 (grado VII) (nombre_tonalidad ?nt) (modo_tonalidad ?mt) (fundamental ?g7) (tercera ?g2) (quinta ?g4) (septima ?g6)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;			HECHOS CALCULADOS		      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hechos asertados a partir del conocimiento extraído de la partitura
; TONALIDAD
(deftemplate tonalidad_obra

	(slot nombre)
	(slot modo)
)

; Regla para abrir el fichero de la tonalidad
(defrule abrir_tonalidad
	(declare (salience 20))
	=>
	(open "Tonalidad" mydata_tonalidad)
	(assert (SeguirLeyendoTonalidad))
)

;Regla para leer la tonalidad
(defrule leer_tonalidad
	?f <- (SeguirLeyendoTonalidad)
	=>
	(bind ?nombre (read mydata_tonalidad))
	(retract ?f)
	(if (neq ?nombre EOF) then
		(bind ?modo (read mydata_tonalidad))
		(assert (tonalidad_obra (nombre ?nombre) (modo ?modo)))
		(assert (SeguirLeyendoTonalidad))
	)
)

;NOTAS ACORDES
(deftemplate nota

	(slot tono)
	(slot altura)
	(slot voz)
	(slot indice)
)

; Regla para abrir el fichero de la soprano
(defrule abrir_soprano
	(declare (salience 10))
	=>
	(open "Soprano" mydata_soprano)
	(assert (SeguirLeyendoSoprano))
)

;Regla para leer las notas de la soprano
(defrule leer_notas_soprano
	?f <- (SeguirLeyendoSoprano)
	?c <- (contador_soprano ?i)
	=>
	(bind ?tono (read mydata_soprano))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_soprano))
		(assert (nota (tono ?tono) (altura ?altura) (voz 1) (indice ?i)))
		(assert (SeguirLeyendoSoprano))
		(assert (contador_soprano ?i))
	)
)

; Regla para abrir el fichero de la contraalto
(defrule abrir_contraalto
	(declare (salience 10))
	=>
	(open "Contraalto" mydata_contraalto)
	(assert (SeguirLeyendoContraalto))
)

;Regla para leer las notas de la contraalto
(defrule leer_notas_contraalto
	?f <- (SeguirLeyendoContraalto)
	?c <- (contador_contraalto ?i)
	=>
	(bind ?tono (read mydata_contraalto))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_contraalto))
		(assert (nota (tono ?tono) (altura ?altura) (voz 2) (indice ?i)))
		(assert (SeguirLeyendoContraalto))
		(assert (contador_contraalto ?i))
	)
)

; Regla para abrir el fichero del tenor
(defrule abrir_tenor
	(declare (salience 10))
	=>
	(open "Tenor" mydata_tenor)
	(assert (SeguirLeyendoTenor))
)

;Regla para leer las notas del tenor
(defrule leer_notas_tenor
	?f <- (SeguirLeyendoTenor)
	?c <- (contador_tenor ?i)
	=>
	(bind ?tono (read mydata_tenor))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_tenor))
		(assert (nota (tono ?tono) (altura ?altura) (voz 3) (indice ?i)))
		(assert (SeguirLeyendoTenor))
		(assert (contador_tenor ?i))
	)
)

; Regla para abrir el fichero del bajo
(defrule abrir_bajo
	(declare (salience 10))
	=>
	(open "Bajo" mydata_bajo)
	(assert (SeguirLeyendoBajo))
)

;Regla para leer las notas del bajo
(defrule leer_notas_bajo
	?f <- (SeguirLeyendoBajo)
	?c <- (contador_bajo ?i)
	=>
	(bind ?tono (read mydata_bajo))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_bajo))
		(assert (nota (tono ?tono) (altura ?altura) (voz 4) (indice ?i)))
		(assert (SeguirLeyendoBajo))
		(assert (contador_bajo ?i))
	)
)

;NOTAS MELODÍAS
(deftemplate nota_melodia

	(slot tono)
	(slot altura)
	(slot voz)
	(slot indice)
)

; Regla para abrir el fichero de la melodía de la soprano
(defrule abrir_melodia_soprano
	(declare (salience 10))
	=>
	(open "Soprano_Melodia" mydata_melodia_soprano)
	(assert (SeguirLeyendoMelodiaSoprano))
)

;Regla para leer las notas de melodía de la soprano
(defrule leer_notas_melodia_soprano
	?f <- (SeguirLeyendoMelodiaSoprano)
	?c <- (contador_melodia_soprano ?i)
	=>
	(bind ?tono (read mydata_melodia_soprano))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_melodia_soprano))
		(assert (nota_melodia (tono ?tono) (altura ?altura) (voz 1) (indice ?i)))
		(assert (SeguirLeyendoMelodiaSoprano))
		(assert (contador_melodia_soprano ?i))
	)
)

; Regla para abrir el fichero de la melodía de la contraalto
(defrule abrir_melodia_contraalto
	(declare (salience 10))
	=>
	(open "Contraalto_Melodia" mydata_melodia_contraalto)
	(assert (SeguirLeyendoMelodiaContraalto))
)

;Regla para leer las notas de la melodía de la contraalto
(defrule leer_notas_melodia_contraalto
	?f <- (SeguirLeyendoMelodiaContraalto)
	?c <- (contador_melodia_contraalto ?i)
	=>
	(bind ?tono (read mydata_melodia_contraalto))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_melodia_contraalto))
		(assert (nota_melodia (tono ?tono) (altura ?altura) (voz 2) (indice ?i)))
		(assert (SeguirLeyendoMelodiaContraalto))
		(assert (contador_melodia_contraalto ?i))
	)
)

; Regla para abrir el fichero de la melodía del tenor
(defrule abrir_melodia_tenor
	(declare (salience 10))
	=>
	(open "Tenor_Melodia" mydata_melodia_tenor)
	(assert (SeguirLeyendoMelodiaTenor))
)

;Regla para leer las notas de la melodía del tenor
(defrule leer_notas_melodia_tenor
	?f <- (SeguirLeyendoMelodiaTenor)
	?c <- (contador_melodia_tenor ?i)
	=>
	(bind ?tono (read mydata_melodia_tenor))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_melodia_tenor))
		(assert (nota_melodia (tono ?tono) (altura ?altura) (voz 3) (indice ?i)))
		(assert (SeguirLeyendoMelodiaTenor))
		(assert (contador_melodia_tenor ?i))
	)
)

; Regla para abrir el fichero de la melodía del bajo
(defrule abrir_melodia_bajo
	(declare (salience 10))
	=>
	(open "Bajo_Melodia" mydata_melodia_bajo)
	(assert (SeguirLeyendoMelodiaBajo))
)

;Regla para leer las notas de la melodía del bajo
(defrule leer_notas_melodia_bajo
	?f <- (SeguirLeyendoMelodiaBajo)
	?c <- (contador_melodia_bajo ?i)
	=>
	(bind ?tono (read mydata_melodia_bajo))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tono EOF) then
		(bind ?altura (read mydata_melodia_bajo))
		(assert (nota_melodia (tono ?tono) (altura ?altura) (voz 4) (indice ?i)))
		(assert (SeguirLeyendoMelodiaBajo))
		(assert (contador_melodia_bajo ?i))
	)
)

;MOVIMIENTOS
(deftemplate movimiento

	(slot tipo)
	(slot voz)
	(slot indice)
)

; Regla para abrir el fichero de los movimientos la soprano
(defrule abrir_movimientos_soprano
	(declare (salience 10))
	=>
	(open "MovimientosSoprano" mydata_mov_soprano)
	(assert (SeguirLeyendoMovimientosSoprano))
)

;Regla para leer los movimientos de la soprano
(defrule leer_movimientos_soprano
	?f <- (SeguirLeyendoMovimientosSoprano)
	?c <- (contador_mov_soprano ?i)
	=>
	(bind ?tipo (read mydata_mov_soprano))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tipo EOF) then
		(assert (movimiento (tipo ?tipo) (voz 1) (indice ?i)))
		(assert (SeguirLeyendoMovimientosSoprano))
		(assert (contador_mov_soprano ?i))
	)
	
)

; Regla para abrir el fichero de los movimientos de la contraalto
(defrule abrir_movimientos_contraalto
	(declare (salience 10))
	=>
	(open "MovimientosContraalto" mydata_mov_contraalto)
	(assert (SeguirLeyendoMovimientosContraalto))
)

;Regla para leer los movimientos de la contraalto
(defrule leer_movimientos_contraalto
	?f <- (SeguirLeyendoMovimientosContraalto)
	?c <- (contador_mov_contraalto ?i)
	=>
	(bind ?tipo (read mydata_mov_contraalto))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tipo EOF) then
		(assert (movimiento (tipo ?tipo) (voz 2) (indice ?i)))
		(assert (SeguirLeyendoMovimientosContraalto))
		(assert (contador_mov_contraalto ?i))
	)
	
)

; Regla para abrir el fichero de los movimientos del tenor
(defrule abrir_movimientos_tenor
	(declare (salience 10))
	=>
	(open "MovimientosTenor" mydata_mov_tenor)
	(assert (SeguirLeyendoMovimientosTenor))
)

;Regla para leer los movimientos de la tenor
(defrule leer_movimientos_tenor
	?f <- (SeguirLeyendoMovimientosTenor)
	?c <- (contador_mov_tenor ?i)
	=>
	(bind ?tipo (read mydata_mov_tenor))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tipo EOF) then
		(assert (movimiento (tipo ?tipo) (voz 3) (indice ?i)))
		(assert (SeguirLeyendoMovimientosTenor))
		(assert (contador_mov_tenor ?i))
	)
	
)

; Regla para abrir el fichero de los movimientos del bajo
(defrule abrir_movimientos_bajo
	(declare (salience 10))
	=>
	(open "MovimientosBajo" mydata_mov_bajo)
	(assert (SeguirLeyendoMovimientosBajo))
)

;Regla para leer los movimientos del bajo
(defrule leer_movimientos_bajo
	?f <- (SeguirLeyendoMovimientosBajo)
	?c <- (contador_mov_bajo ?i)
	=>
	(bind ?tipo (read mydata_mov_bajo))
	(retract ?f)
	(retract ?c)
	(bind ?i (+ ?i 1))
	(if (neq ?tipo EOF) then
		(assert (movimiento (tipo ?tipo) (voz 4) (indice ?i)))
		(assert (SeguirLeyendoMovimientosBajo))
		(assert (contador_mov_bajo ?i))
	)
	
)

; Regla para cerrar los ficheros
(defrule cerrar_archivos
	(declare (salience -10))
	=>
	(close mydata_tonalidad)
	(close mydata_soprano)
	(close mydata_contraalto)
	(close mydata_tenor)
	(close mydata_bajo)
	(close mydata_mov_soprano)
	(close mydata_mov_contraalto)
	(close mydata_mov_tenor)
	(close mydata_mov_bajo)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		MODULO 1: FALLOS ARMÓNICOS		      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; QUINTAS

; Regla para buscar intervalos de 5ªs consecutivas
(defrule buscar_posibles_quintas

	(nota (tono ?t1) (voz ?v1) (indice ?i1))
	(nota (tono ?t2) (voz ?v2) (indice ?i1))
	(nota (tono ?t3) (voz ?v1) (indice ?i2))
	(nota (tono ?t4) (voz ?v2) (indice ?i2))
	(test (< ?v1 ?v2))
	(test (= ?i2 (+ ?i1 1)))
	(and 
		(exists (intervalo (distancia 5) (nota1 ?t2) (nota2 ?t1))) 
		(exists (intervalo (distancia 5) (nota1 ?t4) (nota2 ?t3)))
	)
	=>
	(assert (posibleFallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1)))
)

; Si hay dos quintas consecutivas en voces extremas se considera falta
(defrule comprobar_fallos_quintas_extremos

	(posibleFallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1))
	(and (test (eq ?v1 1)) (test(eq ?v2 4))) 
	=>
	(assert (fallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1)))
)

; Si hay dos quintas consecutivas siendo la segunda una quinta justa se considera falta
(defrule comprobar_fallos_quintas_justas

	(posibleFallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1))
	(nota (tono ?t1) (voz ?v1) (indice ?i2))
	(nota (tono ?t2) (voz ?v2) (indice ?i2))
	(test (= ?i2 (+ ?i1 1)))
	(exists (intervalo (distancia 5) (tipo justa) (nota1 ?t2) (nota2 ?t1)))
	=>
	(assert (fallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1)))
)

; Regla para buscar quintas directas en voces extremas
(defrule buscar_quintas_directas

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 4) (indice ?i))
	(exists (intervalo (distancia 5) (nota1 ?t2) (nota2 ?t1)))
	=>
	(bind ?indice (- ?i 1))
	(assert (posibleFallo (tipo quintas_directas) (voz1 1) (voz2 4) (tiempo ?indice)))
)

; Compramos las posibles quintas directas
(defrule comprobar_quintas_directas

	(posibleFallo (tipo quintas_directas) (voz1 1) (voz2 4) (tiempo ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 1) (indice ?i2))
	(test (= ?i2 (+ ?i 1)))
	(not (exists (intervalo (distancia 2) (nota1 ?t1) (nota2 ?t2))))
	(not (exists (intervalo (distancia 2) (nota1 ?t2) (nota2 ?t1))))
	(or 
		(and (exists (movimiento (tipo ascendente) (voz 1) (indice ?i)))
		     (exists (movimiento (tipo ascendente) (voz 4) (indice ?i)))
		)

		(and (exists (movimiento (tipo descendente) (voz 1) (indice ?i)))
		     (exists (movimiento (tipo descendente) (voz 4) (indice ?i)))
		)
	)
	=>
	
	(assert (fallo (tipo quintas_directas) (voz1 1) (voz2 4) (tiempo ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OCTAVAS

; Regla para buscar intervalos de 8ªs consecutivas
(defrule buscar_octavas

	(nota (tono ?t1) (voz ?v1) (indice ?i1))
	(nota (tono ?t2) (voz ?v2) (indice ?i1))
	(nota (tono ?t3) (voz ?v1) (indice ?i2))
	(nota (tono ?t4) (voz ?v2) (indice ?i2))
	(test (< ?v1 ?v2))
	(test (= ?i2 (+ ?i1 1)))
	(and 
		(exists (intervalo (distancia 8) (nota1 ?t2) (nota2 ?t1))) 
		(exists (intervalo (distancia 8) (nota1 ?t4) (nota2 ?t3)))
	)
	=>
	(assert (fallo (tipo octavas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1)))
)

; Regla para buscar octavas directas en voces extremas
(defrule buscar_octavas_directas

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 4) (indice ?i))
	(exists (intervalo (distancia 8) (nota1 ?t1) (nota2 ?t2)))
	=>
	(bind ?indice (- ?i 1))
	(assert (posibleFallo (tipo octavas_directas) (voz1 1) (voz2 4) (tiempo ?indice)))
)

; Compramos las posibles octavas directas
(defrule comprobar_octavas_directas

	(posibleFallo (tipo octavas_directas) (voz1 1) (voz2 4) (tiempo ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 1) (indice ?i1))
	(test (= ?i1 (+ ?i 1)))
	(or 
	    (not (exists (intervalo (distancia 2) (nota1 ?t1) (nota2 ?t2))))
	    (not (exists (intervalo (distancia 2) (nota1 ?t2) (nota2 ?t1))))
	)
	(or 
		(and (exists (movimiento (tipo ascendente) (voz 1) (indice ?i)))
		     (exists (movimiento (tipo ascendente) (voz 4) (indice ?i)))
		)

		(and (exists (movimiento (tipo descendente) (voz 1) (indice ?i)))
		     (exists (movimiento (tipo descendente) (voz 4) (indice ?i)))
		)
	)
	=>
	(assert (fallo (tipo octavas_directas) (voz1 1) (voz2 4) (tiempo ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TRITONOS

; Regla para buscar tritonos
(defrule buscar_tritono

	(nota (tono ?t1) (voz ?v1) (indice ?i1))
	(nota (tono ?t2) (voz ?v2) (indice ?i1))
	(test (< ?v1 ?v2))
	(exists (intervalo (distancia 4) (tipo aumentada) (nota1 ?t2) (nota2 ?t1)))	
	=>
	(bind ?i (- ?i1 1))
	(assert (posibleFallo (tipo tritono) (voz1 ?v1) (voz2 ?v2) (tiempo ?i)))
)

; Si se llega a un tritono por movimiento directo
(defrule comprobar_tritonos

	(posibleFallo (tipo tritono) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
	(or 
		(and (exists (movimiento (tipo ascendente) (voz ?v1) (indice ?i)))
		     (exists (movimiento (tipo ascendente) (voz ?v2) (indice ?i)))
		)

		(and (exists (movimiento (tipo descendente) (voz ?v1) (indice ?i)))
		     (exists (movimiento (tipo descendente) (voz ?v2) (indice ?i)))
		)
	)
	=>
	(assert (fallo (tipo tritono) (voz1 ?v1) (voz2 ?v2) (tiempo ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SENSIBLES

;Regla para comporbar la duplicación de sensibles
(defrule comprobar_sensibles_duplicadas

	(nota (tono ?t1) (voz ?v1) (indice ?i))
	(nota (tono ?t1) (voz ?v2) (indice ?i))
	(tonalidad_obra (nombre ?n) (modo ?m))
	(tonalidad (nombre ?n) (modo ?m) (sensible ?t1))
	(test (!= ?v1 ?v2))
	=>
	
	(assert (fallo (tipo duplicacion_sensible) (voz1 ?v1) (voz2 ?v2) (tiempo ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ANALIZAR ACORDES TRIADA

; Regla para señalar los acordes de triada en estado fundamental
(defrule analizar_acordes_triada_fundamental

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?t4) (tercera ?tercera) (quinta ?quinta))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or (or (test(eq ?t1 ?t4))
		(test(eq ?t1 ?tercera))	
	    )
	    (test(eq ?t1 ?quinta))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or (or (test(eq ?t2 ?t4))
		(test(eq ?t2 ?tercera))	
	    )
	    (test(eq ?t2 ?quinta))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or (or (test(eq ?t3 ?t4))
		(test(eq ?t3 ?tercera))	
	    )
	    (test(eq ?t3 ?quinta))
	)
	=>
	(assert (acorde (grado ?g) (septima no) (inversion primera) (indice ?i)))
)

; Regla para señalar los acordes de triada en segunda inversión
(defrule analizar_acordes_triada_segunda

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?t4) (quinta ?quinta))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or (or (test(eq ?t1 ?t4))
		(test(eq ?t1 ?fundamental))	
	    )
	    (test(eq ?t1 ?quinta))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or (or (test(eq ?t2 ?t4))
		(test(eq ?t2 ?fundamental))	
	    )
	    (test(eq ?t2 ?quinta))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or (or (test(eq ?t3 ?t4))
		(test(eq ?t3 ?fundamental))	
	    )
	    (test(eq ?t3 ?quinta))
	)
	=>
	(assert (acorde (grado ?g) (septima no) (inversion segunda) (indice ?i)))
)

; Regla para señalar los acordes de tríada en tercera inversión
(defrule analizar_acordes_triada_tercera

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?t4))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or (or (test(eq ?t1 ?t4))
		(test(eq ?t1 ?fundamental))	
	    )
	    (test(eq ?t1 ?tercera))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or (or (test(eq ?t2 ?t4))
		(test(eq ?t2 ?fundamental))	
	    )
	    (test(eq ?t2 ?tercera))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or (or (test(eq ?t3 ?t4))
		(test(eq ?t3 ?fundamental))	
	    )
	    (test(eq ?t3 ?tercera))
	)
	=>
	(assert (acorde (grado ?g) (septima no) (inversion tercera) (indice ?i)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ANALIZAR ACORDES CUATRIADA

; Regla para señalar los acordes de cuatriada en estado fundamental
(defrule analizar_acordes_cuatriada_fundamental

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?t4) (tercera ?tercera) (quinta ?quinta) (septima ?septima))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t1 ?t4))
		    (test(eq ?t1 ?tercera))	
	        )
	        (test(eq ?t1 ?quinta))
	    )

	    (test(eq ?t1 ?septima))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t2 ?t4))
		    (test(eq ?t2 ?tercera))	
	        )
	        (test(eq ?t2 ?quinta))
	    )

	    (test(eq ?t2 ?septima))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t3 ?t4))
		    (test(eq ?t3 ?tercera))	
	        )
	        (test(eq ?t3 ?quinta))
	    )

	    (test(eq ?t3 ?septima))
	)
	=>
	(assert (acorde (grado ?g) (septima si) (inversion primera) (indice ?i)))
)

; Regla para señalar los acordes de cuatriada en segunda inversión
(defrule analizar_acordes_cuatriada_segunda

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?t4) (quinta ?quinta) (septima ?septima))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t1 ?t4))
		    (test(eq ?t1 ?fundamental))	
	        )
	        (test(eq ?t1 ?quinta))
	    )

	    (test(eq ?t1 ?septima))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t2 ?t4))
		    (test(eq ?t2 ?fundamental))	
	        )
	        (test(eq ?t2 ?quinta))
	    )

	    (test(eq ?t2 ?septima))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t3 ?t4))
		    (test(eq ?t3 ?fundamental))	
	        )
	        (test(eq ?t3 ?quinta))
	    )

	    (test(eq ?t3 ?septima))
	)
	=>
	(assert (acorde (grado ?g) (septima si) (inversion segunda) (indice ?i)))
)

; Regla para señalar los acordes de cuatriada en tercera inversión
(defrule analizar_acordes_cuatriada_tercera

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?t4) (septima ?septima))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t1 ?t4))
		    (test(eq ?t1 ?tercera))	
	        )
	        (test(eq ?t1 ?fundamental))
	    )

	    (test(eq ?t1 ?septima))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t2 ?t4))
		    (test(eq ?t2 ?tercera))	
	        )
	        (test(eq ?t2 ?fundamental))
	    )

	    (test(eq ?t2 ?septima))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t3 ?t4))
		    (test(eq ?t3 ?tercera))	
	        )
	        (test(eq ?t3 ?fundamental))
	    )

	    (test(eq ?t3 ?septima))
	)
	=>
	(assert (acorde (grado ?g) (septima si) (inversion tercera) (indice ?i)))
)

; Regla para señalar los acordes de cuatriada en cuarta inversión
(defrule analizar_acordes_cuatriada_cuarta

	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i)) 
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?quinta) (septima ?t4))
	; Comprobamos que la nota de la soprano sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t1 ?t4))
		    (test(eq ?t1 ?tercera))	
	        )
	        (test(eq ?t1 ?quinta))
	    )

	    (test(eq ?t1 ?fundamental))
	)
	; Comprobamos que la nota de la contraalto sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t2 ?t4))
		    (test(eq ?t2 ?tercera))	
	        )
	        (test(eq ?t2 ?quinta))
	    )

	    (test(eq ?t2 ?fundamental))
	)
	; Comprobamos que la nota del tenor sea alguna del acorde
	(or 
	    (or
		(or (test(eq ?t3 ?t4))
		    (test(eq ?t3 ?tercera))	
	        )
	        (test(eq ?t3 ?quinta))
	    )

	    (test(eq ?t3 ?fundamental))
	)
	=>
	(assert (acorde (grado ?g) (septima si) (inversion cuarta) (indice ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; COMPROBAR LÓGICA TONAL

; Regla para comprobar si existe una secuencia lógica entre dos acordes consecutivos
(defrule comprobar_logica_tonal

	(acorde (grado ?g1) (indice ?i))
	(acorde (grado ?g2) (indice ?j))
	(test(= ?j (+ ?i 1)))
	(not (sucesionLogica (acorde1 ?g1) (acorde2 ?g2)))
	=>
	(assert (fallor (tipo sucesionLogica) (tiempo ?i)))
)

; Regla para comprobar que no hay dos acordes en segunda inversión consecutivos
(defrule comprobar_segundas_inversiones_consecutivas

	(acorde (inversion segunda) (indice ?i))
	(acorde (inversion segunda) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	=>
	(assert (fallo (tipo segundas_inversiones_consecutivas) (tiempo ?i)))
)

; Regla para encontrar series de sextas
(defrule encontrar_series_sextas

	(acorde (grado ?g1) (inversion primera) (indice ?i))
	(acorde (grado ?g2) (inversion primera) (indice ?j))
	(acorde (grado ?g3) (inversion primera) (indice ?k))
	(nota (tono ?t1) (voz 4) (indice ?i))
	(nota (tono ?t2) (voz 4) (indice ?j))
	(nota (tono ?t3) (voz 4) (indice ?k))
	(test(eq ?i (+ ?j 1)))
	(test(eq ?j (+ ?k 1)))
	(not (sucesionLogica (acorde1 ?g1) (acorde2 ?g2)))
	(not (sucesionLogica (acorde1 ?g2) (acorde2 ?g3)))
	=>
	(assert(serieSextas ?i))
)

; Reglas para comprobar que no hay sucesiones incorrectas como
;	- I-II en estado fundamental
;	- II-III en estado fundamental
;	- III-IV en estado fundamental
(defrule encontrar_sucesion_erronea1

	(acorde (grado I) (inversion fundamental) (indice ?i))
	(acorde (grado II) (inversion fundamental) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	=>
	(assert (fallo (tipo sucesion_acordes_erronea_1) (tiempo ?i)))
)

(defrule encontrar_sucesion_erronea2

	(acorde (grado II) (inversion fundamental) (indice ?i))
	(acorde (grado III) (inversion fundamental) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	=>
	(assert (fallo (tipo sucesion_acordes_erronea_2) (tiempo ?i)))
)

(defrule encontrar_sucesion_erronea3

	(acorde (grado III) (inversion fundamental) (indice ?i))
	(acorde (grado IV) (inversion fundamental) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	=>
	(assert (fallo (tipo sucesion_acordes_erronea_3) (tiempo ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; COMPROBAR ACORDES COMPLETOS

; Regla para comprobar que los acordes de tríada en estado fundamental están completos
(defrule acordes_triada_completos_fundamental

	(acorde (grado ?g) (septima no) (inversion fundamental) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?t4) (tercera ?tercera) (quinta ?quinta))
	(or
		(or
			(and 
				;Si la soprano duplica la fundamental, contraalto y tenor tienen que tener la tercera y la quinta
				(test(eq ?t1 ?t4))
				(or 
					; Contraalto tercera
					; Tenor quinta
					(and (test(eq ?t2 ?tercera))
			     	     	     (test(eq ?t3 ?quinta))
			     		)

			     		; Contraalto quinta
					; Tenor tercera
			     		(and (test(eq ?t2 ?quinta))
			     	     	     (test(eq ?t3 ?tercera))
			     		)
				)
			)

			(and 
				;Si la soprano es la tercera, contraalto o tenor tienen que ser la quinta
				(test(eq ?t1 ?tercera))
				(or 
					;Contraalto quinta
			     	     	(test(eq ?t2 ?quinta))
			     		
			     		; Tenor quinta
			     		(test(eq ?t3 ?quinta))
				)
			)
		)

		(and 
			;Si la soprano es la quinta, contraalto o tenor tienen que ser la tercera
			(test(eq ?t1 ?quinta))
			(or 
				; Contraalto tercera
				(test(eq ?t2 ?tercera))
		     	     	   
				; Tenor tercera
			        (test(eq ?t3 ?tercera))
			)
		)
	)
	=>
	(assert (acordeCompleto ?i))
)

; Regla para comprobar que los acordes de tríada en primera inversión están completos
(defrule acordes_triada_completos_primera

	(acorde (grado ?g) (septima no) (inversion fundamental) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?t4) (quinta ?quinta))
	(or
		(or
			(and 
				;Si la soprano duplica la tercera, contraalto y tenor tienen que tener la fundamental y la quinta
				(test(eq ?t1 ?t4))
				(or 
					; Contraalto fundamental
					; Tenor quinta
					(and (test(eq ?t2 ?fundamental))
			     	     	     (test(eq ?t3 ?quinta))
			     		)

			     		; Contraalto quinta
					; Tenor fundamental
			     		(and (test(eq ?t2 ?quinta))
			     	     	     (test(eq ?t3 ?fundamental))
			     		)

				)
			)

			(and 
				;Si la soprano es la fundamental, contraalto o tenor tienen que ser la quinta
				(test(eq ?t1 ?fundamental))
				(or 
					;Contraalto quinta
			     	     	(test(eq ?t2 ?quinta))
			     		
			     		; Tenor quinta
			     		(test(eq ?t3 ?quinta))
				)
			)
		)

		(and 
			;Si la soprano es la quinta, contraalto o tenor tienen que ser la fundamental
			(test(eq ?t1 ?quinta))
			(or 
				; Contraalto fundamental
				(test(eq ?t2 ?fundamental))
		     	     	   
				; Tenor fundamental
			        (test(eq ?t3 ?fundamental))
			)
		)
	)
	=>
	(assert (acordeCompleto ?i))
)

; Regla para comprobar que los acordes de tríada en segunda inversión están completos
(defrule acordes_triada_completos_segunda

	(acorde (grado ?g) (septima no) (inversion fundamental) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?t4))
	(or
		(or
			(and 
				;Si la soprano duplica la quinta, contraalto y tenor tienen que tener la fundamental y la tercera
				(test(eq ?t1 ?t4))
				(or 
					; Contraalto fundamental
					; Tenor tercera
					(and (test(eq ?t2 ?fundamental))
			     	     	     (test(eq ?t3 ?tercera))
			     		)

			     		; Contraalto tercera
					; Tenor fundamental
			     		(and (test(eq ?t2 ?tercera))
			     	     	     (test(eq ?t3 ?fundamental))
			     		)

				)
			)

			(and 
				;Si la soprano es la fundamental, contraalto o tenor tienen que ser la tercera
				(test(eq ?t1 ?fundamental))
				(or 
					;Contraalto tercera
			     	     	(test(eq ?t2 ?tercera))
			     		
			     		; Tenor tercera
			     		(test(eq ?t3 ?tercera))
				)
			)
		)

		(and 
			;Si la soprano es la tercera, contraalto o tenor tienen que ser la fundamental
			(test(eq ?t1 ?tercera))
			(or 
				; Contraalto fundamental
				(test(eq ?t2 ?fundamental))
		     	     	   
				; Tenor fundamental
			        (test(eq ?t3 ?fundamental))
			)
		)
	)
	=>
	(assert (acordeCompleto ?i))
)


; Regla para comprobar que los acordes de cuatríada en estado fundamental están completos
(defrule acordes_cuatriada_completos_fundamental

	(acorde (grado ?g) (septima si) (inversion fundamental) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?t4) (tercera ?tercera) (quinta ?quinta) (septima ?septima))
	; Se puede omtir la quinta
	(or
		(or
			(or
				(and 
					; Si la soprano duplica la fundamental, contraalto y tenor tienen que tener la tercera y la séptima
					(test(eq ?t1 ?t4))
					(or 
						; Contraalto tercera
						; Tenor septima
						(and (test(eq ?t2 ?tercera))
				     	     	     (test(eq ?t3 ?septima))
				     		)

				     		; Contraalto septima
						; Tenor tercera
				     		(and (test(eq ?t2 ?septima))
				     	     	     (test(eq ?t3 ?tercera))
				     		)
					)
				)

				(and 
					;Si la soprano es la tercera, contraalto o tenor tienen que ser la séptima
					(test(eq ?t1 ?tercera))
					(or 
						; Tenor septima
			     		     	(test(eq ?t3 ?septima))
			 	
				     		; Contraalto septima
				     		(test(eq ?t2 ?septima))				     	  
					)
				)
			)

			(and 
				;Si la soprano es la quinta, contraalto y tenor tienen que ser la tercera y la séptima
				(test(eq ?t1 ?quinta))
				(or 
					; Contraalto tercera
					; Tenor septima
					(and (test(eq ?t2 ?tercera))
				     	     (test(eq ?t3 ?septima))
			     		)

			     		; Contraalto septima
					; Tenor tercera
			     		(and (test(eq ?t2 ?septima))
			       	     	     (test(eq ?t3 ?tercera))
			     		)
				)
			)
		)

		(and 
			;Si la soprano es la séptima, contraalto o tenor tienen que ser tercera
			(test(eq ?t1 ?septima))
			(or 
				; Contraalto tercera
				(test(eq ?t2 ?tercera))

				; Tenor tercera
		     	     	(test(eq ?t3 ?tercera))		    		
		     	)
		)	
	)
	=>
	(assert (acordeCompleto ?i))
)

; Regla para comprobar que los acordes de cuatríada en primera inversión están completos
(defrule acordes_cuatriada_completos_primera

	(acorde (grado ?g) (septima si) (inversion primera) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?t4) (quinta ?quinta) (septima ?septima))
	(or
		(or
			(and 
				;Si la soprano es la fundamental, contraalto y tenor tienen que tener la quinta y la séptima
				(test(eq ?t1 ?fundamental))
				(or 
					; Contraalto quinta
					; Tenor septima
					(and (test(eq ?t2 ?quinta))
			     	     	     (test(eq ?t3 ?septima))
			     		)

			     		; Contraalto septima
					; Tenor quinta
			     		(and (test(eq ?t2 ?septima))
			     	     	     (test(eq ?t3 ?quinta))
			     		)

				)
			)

			(and 
				;Si la soprano es la quinta, contraalto y tenor tienen que ser la fundamental y la séptima
				(test(eq ?t1 ?quinta))
				(or 
					; Contraalto fundamental
					; Tenor septima
					(and (test(eq ?t2 ?fundamental))
			     	     	     (test(eq ?t3 ?septima))
			     		)

			     		; Contraalto septima
					; Tenor fundamental
			     		(and (test(eq ?t2 ?septima))
			     	     	     (test(eq ?t3 ?fundamental))
			     		)
				)
			)
		)

		(and 
			;Si la soprano es la sétpima, contraalto y tenor tienen que ser la fundamental y la quinta
			(test(eq ?t1 ?septima))
			(or 
				; Contraalto fundamental
				; Tenor quinta
				(and (test(eq ?t2 ?fundamental))
			     	     (test(eq ?t3 ?quinta))
			     	)

			     	; Contraalto quinta
				; Tenor fundamental
			     	(and (test(eq ?t2 ?quinta))
			     	     (test(eq ?t3 ?fundamental))
			     	)
			)
		)
	)
	=>
	(assert (acordeCompleto ?i))
)

; Regla para comprobar que los acordes de cuatríada en segunda inversión están completos
(defrule acordes_cuatriada_completos_segunda

	(acorde (grado ?g) (septima si) (inversion segunda) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?t4) (septima ?septima))
	(or
		(or
			(and 
				;Si la soprano es la fundamental, contraalto y tenor tienen que tener la tercera y la séptima
				(test(eq ?t1 ?fundamental))
				(or 
					; Contraalto tercera
					; Tenor septima
					(and (test(eq ?t2 ?tercera))
			     	     	     (test(eq ?t3 ?septima))
			     		)

			     		; Contraalto septima
					; Tenor tercera
			     		(and (test(eq ?t2 ?septima))
			     	     	     (test(eq ?t3 ?tercera))
			     		)

				)
			)

			(and 
				;Si la soprano es la tercera, contraalto y tenor tienen que ser la fundamental y la séptima
				(test(eq ?t1 ?tercera))
				(or 
					; Contraalto fundamental
					; Tenor septima
					(and (test(eq ?t2 ?fundamental))
			     	     	     (test(eq ?t3 ?septima))
			     		)

			     		; Contraalto septima
					; Tenor fundamental
			     		(and (test(eq ?t2 ?septima))
			     	     	     (test(eq ?t3 ?fundamental))
			     		)
				)
			)
		)

		(and 
			;Si la soprano es la sétpima, contraalto y tenor tienen que ser la fundamental y la tercera
			(test(eq ?t1 ?septima))
			(or 
				; Contraalto fundamental
				; Tenor tercera
				(and (test(eq ?t2 ?fundamental))
			     	     (test(eq ?t3 ?tercera))
			     	)

			     	; Contraalto tercera
				; Tenor fundamental
			     	(and (test(eq ?t2 ?tercera))
			     	     (test(eq ?t3 ?fundamental))
			     	)
			)
		)
	)
	=>
	(assert (acordeCompleto ?i))
)


; Regla para comprobar que los acordes de cuatríada en tercera inversión están completos
(defrule acordes_cuatriada_completos_tercera

	(acorde (grado ?g) (septima si) (inversion tercera) (indice ?i))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_4 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?quinta) (septima ?t4))
	(or
		(or
			(and 
				;Si la soprano es la fundamental, contraalto y tenor tienen que tener la tercera y la quinta
				(test(eq ?t1 ?fundamental))
				(or 
					; Contraalto tercera
					; Tenor quinta
					(and (test(eq ?t2 ?tercera))
			     	     	     (test(eq ?t3 ?quinta))
			     		)

			     		; Contraalto quinta
					; Tenor tercera
			     		(and (test(eq ?t2 ?quinta))
			     	     	     (test(eq ?t3 ?tercera))
			     		)

				)
			)

			(and 
				;Si la soprano es la tercera, contraalto y tenor tienen que ser la fundamental y la quinta
				(test(eq ?t1 ?tercera))
				(or 
					; Contraalto fundamental
					; Tenor quinta
					(and (test(eq ?t2 ?fundamental))
			     	     	     (test(eq ?t3 ?quinta))
			     		)

			     		; Contraalto quinta
					; Tenor fundamental
			     		(and (test(eq ?t2 ?quinta))
			     	     	     (test(eq ?t3 ?fundamental))
			     		)
				)
			)
		)

		(and 
			;Si la soprano es la quinta, contraalto y tenor tienen que ser la fundamental y la tercera
			(test(eq ?t1 ?quinta))
			(or 
				; Contraalto fundamental
				; Tenor tercera
				(and (test(eq ?t2 ?fundamental))
			     	     (test(eq ?t3 ?tercera))
			     	)

			     	; Contraalto tercera
				; Tenor fundamental
			     	(and (test(eq ?t2 ?tercera))
			     	     (test(eq ?t3 ?fundamental))
			     	)
			)
		)
	)
	=>
	(assert (acordeCompleto ?i))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		MODULO 2: FALLOS MELÓDICOS		      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Regla para comprobar que la sensible resuelve
(defrule comprobar_sensibles_resueltas

	(nota (tono ?t1) (voz ?v1) (indice ?i1))
	(nota (tono ?t2) (voz ?v1) (indice ?i2))
	(tonalidad_obra (nombre ?n) (modo ?m))
	(tonalidad (nombre ?n) (modo ?m) (sensible ?t1))
	(test (= ?i2 (+ ?i1 1)))
	(test (neq ?t2 ?n))
	=>
	(assert (fallo (tipo resolucion_sensible) (voz1 ?v1) (voz2 ?v1) (tiempo ?i1)))
)

; Regla para comprobar que las séptimas resuelven
(defrule comprobar_septimas_resueltas

	(acorde (grado V) (septima si) (indice ?i))
	(tonalidad_obra (nombre ?n) (modo ?m))
	(acorde_4 (grado V) (nombre_tonalidad ?n) (modo_tonalidad ?m) (septima ?septima))
	(acorde_3 (grado I) (nombre_tonalidad ?n) (modo_tonalidad ?m) (tercera ?tercera))
	(nota (tono ?septima) (voz ?v) (indice ?i))
	(nota (tono ?t) (voz ?v) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	(not(test(eq ?tercera ?t)))
	=>
	(assert(fallo (tipo resolucion_septima) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
)

; Regla para si hay segundas aumentadas meódicas
(defrule comprobar_segundas_aumentadas_melodicas

	(nota (tono ?t1) (voz ?v1) (indice ?i1))
	(nota (tono ?t2) (voz ?v1) (indice ?i2))
	(test (= ?i2 (+ ?i1 1)))
	(or
		(exists (intervalo (distancia 2) (tipo aumentada) (nota1 ?t1) (nota2 ?t2)))
		(exists (intervalo (distancia 2) (tipo aumentada) (nota1 ?t2) (nota2 ?t1)))
	)
	=>
	(assert (fallo (tipo segunda_aumentada_melodica) (voz1 ?v1) (voz2 ?v1) (tiempo ?i1)))
)

; Regla para si hay tritonos melódicos
(defrule comprobar_tritono_molodico

	(nota (tono ?t1) (voz ?v1) (indice ?i1))
	(nota (tono ?t2) (voz ?v1) (indice ?i2))
	(test (= ?i2 (+ ?i1 1)))
	(or
		(exists (intervalo (distancia 4) (tipo aumentada) (nota1 ?t1) (nota2 ?t2)))
		(exists (intervalo (distancia 4) (tipo aumentada) (nota1 ?t2) (nota2 ?t1)))
	)
	=>
	(assert (fallo (tipo tritono_melodico) (voz1 ?v1) (voz2 ?v1) (tiempo ?i1)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NOTAS EXTRAÑAS

; Regla para encontrar notas extrañas en la voz soprano
(defrule notas_extraña_soprano

	(not(exists(acorde (indice ?i))))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?quinta))
	(or
		(or
			(or
				(or
					(or
						(and
							(test(eq ?t2 ?fundamental))
							(and
								(test(eq ?t3 ?tercera))
								(test(eq ?t4 ?quinta))
							)
						)

						(and
							(test(eq ?t3 ?fundamental))
							(and
								(test(eq ?t4 ?tercera))
								(test(eq ?t2 ?quinta))
							)
						)
					)

					(and
						(test(eq ?t4 ?fundamental))
						(and
							(test(eq ?t2 ?tercera))
							(test(eq ?t3 ?quinta))
						)
					)
				)

				(and
					(test(eq ?t2 ?fundamental))
					(and
						(test(eq ?t4 ?tercera))
						(test(eq ?t3 ?quinta))
					)
				)
			)
			
			(and
				(test(eq ?t3 ?fundamental))
				(and
					(test(eq ?t2 ?tercera))
					(test(eq ?t4 ?quinta))
				)
			)	
		)

		(and
			(test(eq ?t4 ?fundamental))
			(and
				(test(eq ?t3 ?tercera))
				(test(eq ?t2 ?quinta))
			)
		)
	)		
	=>
	(notaExtraña (voz 1) (indice ?i))
)

; Regla para encontrar notas extrañas en la voz contraalto
(defrule notas_extraña_contraalto

	(not(exists(acorde (indice ?i))))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?quinta))
	(or
		(or
			(or
				(or
					(or
						(and
							(test(eq ?t1 ?fundamental))
							(and
								(test(eq ?t3 ?tercera))
								(test(eq ?t4 ?quinta))
							)
						)

						(and
							(test(eq ?t3 ?fundamental))
							(and
								(test(eq ?t4 ?tercera))
								(test(eq ?t1 ?quinta))
							)
						)
					)

					(and
						(test(eq ?t4 ?fundamental))
						(and
							(test(eq ?t1 ?tercera))
							(test(eq ?t3 ?quinta))
						)
					)
				)

				(and
					(test(eq ?t1 ?fundamental))
					(and
						(test(eq ?t4 ?tercera))
						(test(eq ?t3 ?quinta))
					)
				)
			)
			
			(and
				(test(eq ?t3 ?fundamental))
				(and
					(test(eq ?t1 ?tercera))
					(test(eq ?t4 ?quinta))
				)
			)	
		)

		(and
			(test(eq ?t4 ?fundamental))
			(and
				(test(eq ?t3 ?tercera))
				(test(eq ?t1 ?quinta))
			)
		)
	)		
	=>
	(notaExtraña (voz 2) (indice ?i))
)

; Regla para encontrar notas extrañas en la voz tenor
(defrule notas_extraña_tenor

	(not(exists(acorde (indice ?i))))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?quinta))
	(or
		(or
			(or
				(or
					(or
						(and
							(test(eq ?t1 ?fundamental))
							(and
								(test(eq ?t2 ?tercera))
								(test(eq ?t4 ?quinta))
							)
						)

						(and
							(test(eq ?t2 ?fundamental))
							(and
								(test(eq ?t4 ?tercera))
								(test(eq ?t1 ?quinta))
							)
						)
					)

					(and
						(test(eq ?t4 ?fundamental))
						(and
							(test(eq ?t1 ?tercera))
							(test(eq ?t2 ?quinta))
						)
					)
				)

				(and
					(test(eq ?t1 ?fundamental))
					(and
						(test(eq ?t4 ?tercera))
						(test(eq ?t2 ?quinta))
					)
				)
			)
			
			(and
				(test(eq ?t2 ?fundamental))
				(and
					(test(eq ?t1 ?tercera))
					(test(eq ?t4 ?quinta))
				)
			)	
		)

		(and
			(test(eq ?t4 ?fundamental))
			(and
				(test(eq ?t2 ?tercera))
				(test(eq ?t1 ?quinta))
			)
		)
	)		
	=>
	(notaExtraña (voz 3) (indice ?i))
)

; Regla para encontrar notas extrañas en la voz bajo
(defrule notas_extraña_bajo

	(not(exists(acorde (indice ?i))))
	(nota (tono ?t1) (voz 1) (indice ?i))
	(nota (tono ?t2) (voz 2) (indice ?i))
	(nota (tono ?t3) (voz 3) (indice ?i))
	(nota (tono ?t4) (voz 4) (indice ?i))
	(tonalidad_obra (nombre ?nombre) (modo ?modo))
	(acorde_3 (grado ?g) (nombre_tonalidad ?nombre) (modo_tonalidad ?modo) (fundamental ?fundamental) (tercera ?tercera) (quinta ?quinta))
	(or
		(or
			(or
				(or
					(or
						(and
							(test(eq ?t1 ?fundamental))
							(and
								(test(eq ?t2 ?tercera))
								(test(eq ?t3 ?quinta))
							)
						)

						(and
							(test(eq ?t2 ?fundamental))
							(and
								(test(eq ?t3 ?tercera))
								(test(eq ?t1 ?quinta))
							)
						)
					)

					(and
						(test(eq ?t3 ?fundamental))
						(and
							(test(eq ?t1 ?tercera))
							(test(eq ?t2 ?quinta))
						)
					)
				)

				(and
					(test(eq ?t1 ?fundamental))
					(and
						(test(eq ?t3 ?tercera))
						(test(eq ?t2 ?quinta))
					)
				)
			)
			
			(and
				(test(eq ?t2 ?fundamental))
				(and
					(test(eq ?t1 ?tercera))
					(test(eq ?t3 ?quinta))
				)
			)	
		)

		(and
			(test(eq ?t3 ?fundamental))
			(and
				(test(eq ?t2 ?tercera))
				(test(eq ?t1 ?quinta))
			)
		)
	)		
	=>
	(notaExtraña (voz 4) (indice ?i))
)

; Regla para comprobar si una nota extraña es una nota de paso
(defrule comprobar_notas_de_paso

	(notaExtraña (voz ?v) (indice ?i))
	(nota (tono ?t1) (voz ?v) (indice ?i))
	(nota (tono ?t2) (voz ?v) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	(or
		(exists (intervalo (distancia 2) (nota1 ?t1) (nota2 ?t2)))
		(exists (intervalo (distancia 2) (nota1 ?t2) (nota2 ?t1)))
	)
	?aux <- (mod ?i 16)
	(parteDebil ?aux)
	=>
	(assert(notaPaso (voz ?v) (indice ?i)))
)

; Regla para comprobar si una nota extraña es una nota de floreo
(defrule comprobar_notas_de_floreo

	(notaExtraña (voz ?v) (indice ?i))
	(nota (tono ?t1) (voz ?v) (indice ?i))
	(nota (tono ?t2) (voz ?v) (indice ?j))
	(nota (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?i (+ ?j 1)))
	(test(eq ?i (- ?k 1)))
	(or
		(exists (intervalo (distancia 2) (nota1 ?t1) (nota2 ?t2)))
		(exists (intervalo (distancia 2) (nota1 ?t2) (nota2 ?t1)))
	)
	; Vuelve a la misma nota
	(test(eq ?t2 ?t3))
	=>
	(assert(notaFloreo (voz ?v) (indice ?i)))
)

; Regla para comprobar si una nota extraña es una nota de apoyatura
(defrule comprobar_apoyaturas

	(notaExtraña (voz ?v) (indice ?i))
	(nota (tono ?t1) (voz ?v) (indice ?i))
	(nota (tono ?t2) (voz ?v) (indice ?j))
	(test(eq ?i (+ ?j 1)))
	(or
		(exists (intervalo (distancia 2) (nota1 ?t1) (nota2 ?t2)))
		(exists (intervalo (distancia 2) (nota1 ?t2) (nota2 ?t1)))
	)
	?aux <- (mod ?i 16)
	(parteFuerte ?aux)
	=>
	(assert(notaFloreo (voz ?v) (indice ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONTRAPUNTO BAJO-SOPRANO

; Reglas para contar los tipos de movimientos: contrario, directo y oblicuos
(defrule contar_mov_contrarios_1

	?f <- (movContrariosExtremos ?c)
	(movimiento (tipo ascendente) (voz 1) (indice ?i))
	(movimiento (tipo descendente) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movContrariosExtremos ?c))
)

(defrule contar_mov_contrarios_2

	?f <- (movContrariosExtremos ?c)
	(movimiento (tipo descendente) (voz 1) (indice ?i))
	(movimiento (tipo ascendente) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movContrariosExtremos ?c))
)

(defrule contar_mov_directos_1

	?f <- (movDirectosExtremos ?c)
	(movimiento (tipo ascendente) (voz 1) (indice ?i))
	(movimiento (tipo ascendente) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movDirectosExtremos ?c))
)

(defrule contar_mov_directos_2

	?f <- (movDirectosExtremos ?c)
	(movimiento (tipo descendente) (voz 1) (indice ?i))
	(movimiento (tipo descendente) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movDirectosExtremos ?c))
)

(defrule contar_mov_oblicuos_1

	?f <- (movOblicuosExtremos ?c)
	(movimiento (tipo mantiene) (voz 1) (indice ?i))
	(movimiento (tipo descendente) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movOblicuosExtremos ?c))
)

(defrule contar_mov_oblicuos_2

	?f <- (movOblicuosExtremos ?c)
	(movimiento (tipo mantiene) (voz 1) (indice ?i))
	(movimiento (tipo ascendente) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movOblicuosExtremos ?c))
)

(defrule contar_mov_oblicuos_3

	?f <- (movOblicuosExtremos ?c)
	(movimiento (tipo descendente) (voz 1) (indice ?i))
	(movimiento (tipo mantiene) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movOblicuosExtremos ?c))
)

(defrule contar_mov_oblicuos_4

	?f <- (movOblicuosExtremos ?c)
	(movimiento (tipo ascendente) (voz 1) (indice ?i))
	(movimiento (tipo mantiene) (voz 4) (indice ?i))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(movOblicuosExtremos ?c))
)

; Regla para comprobar el contrapunto BAJO-SOPRANO
(defrule contrapunto_bajo_soprano

	(movDirectosExtremos ?directos)
	(movContrariosExtremos ?contrarios)
	(movOblicuosExtremos ?oblicuos)
	(test(< ?contrarios ?directos))
	(test(< ?contrarios ?oblicuos))
	=>
	(assert(fallo (tipo contrapunto_voces_extremas) (voz1 1) (voz2 2) (indice 1)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONTRAPUNTO DEL SALTO

; Regla para comprobar que si hay dos saltos en la misma dirección en la melodía
; de una voz, la primera y la última notas no son disonantes
(defrule comprobar_contrapunto_salto_ascendente

	(nota_melodia (tono ?t1) (voz ?v) (indice ?i))
	(nota_melodia (tono ?t2) (voz ?v) (indice ?j))
	(nota_melodia (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?j (+ ?i 1)))
	(test(eq ?k (+ ?j 1)))
	(movimiento (tipo ascendente) (voz ?v) (indice ?i))
	(movimiento (tipo ascendente) (voz ?v) (indice ?j))
	(intervalo (distancia ?d1) (nota1 ?t1) (nota2 ?t2))
	(intervalo (distancia ?d2) (nota1 ?t2) (nota2 ?t3))
	(intervalo (distancia ?d3) (tipo ?tipo) (nota1 ?t1) (nota ?t3))
	(test(>= ?d1 3))
	(test(>= ?d2 3))
	(intervalo_disonante (distancia ?d3) (tipo ?tipo))
	=>
	(assert(fallo (tipo contrapunto_salto_ascendente) (voz1 ?v) (voz2 ?V) (indice ?i)))
)

(defrule comprobar_contrapunto_salto_ascendente

	(nota_melodia (tono ?t1) (voz ?v) (indice ?i))
	(nota_melodia (tono ?t2) (voz ?v) (indice ?j))
	(nota_melodia (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?j (+ ?i 1)))
	(test(eq ?k (+ ?j 1)))
	(movimiento (tipo descendente) (voz ?v) (indice ?i))
	(movimiento (tipo descendente) (voz ?v) (indice ?j))
	(intervalo (distancia ?d1) (nota1 ?t2) (nota2 ?t1))
	(intervalo (distancia ?d2) (nota1 ?t3) (nota2 ?t2))
	(intervalo (distancia ?d3) (tipo ?tipo) (nota1 ?t3) (nota ?t1))
	(test(>= ?d1 3))
	(test(>= ?d2 3))
	(intervalo_disonante (distancia ?d3) (tipo ?tipo))
	=>
	(assert(fallo (tipo contrapunto_salto_descendente) (voz1 ?v) (voz2 ?V) (indice ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SALTOS MELÓDICOS

; Reglas para contar los tipos de saltos en las melodías

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SOPRANO
(defrule contar_saltos_pequeños_ascendentes_soprano

	?f <- (saltosPequeñosSoprano ?c)
	(nota_melodia (tono ?t1) (voz 1) (indice ?i))
	(nota_melodia (tono ?t2) (voz 1) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 1) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosSoprano ?c))
)

(defrule contar_saltos_pequeños_descendentes_soprano

	?f <- (saltosPequeñosSoprano ?c)
	(nota_melodia (tono ?t1) (voz 1) (indice ?i))
	(nota_melodia (tono ?t2) (voz 1) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 1) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosSoprano ?c))
)

(defrule contar_saltos_grandes_ascendentes_soprano

	?f <- (saltosGrandesSoprano ?c)
	(nota_melodia (tono ?t1) (voz 1) (indice ?i))
	(nota_melodia (tono ?t2) (voz 1) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 1) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesSoprano ?c))
)

(defrule contar_saltos_grandes_descendentes_soprano

	?f <- (saltosGrandesSoprano ?c)
	(nota_melodia (tono ?t1) (voz 1) (indice ?i))
	(nota_melodia (tono ?t2) (voz 1) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 1) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesSoprano ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONTRAALTO
(defrule contar_saltos_pequeños_ascendentes_contraalto
	?f <- (saltosPequeñosContraalto ?c)
	(nota_melodia (tono ?t1) (voz 2) (indice ?i))
	(nota_melodia (tono ?t2) (voz 2) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 2) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosContraalto ?c))
)

(defrule contar_saltos_pequeños_descendentes_contraalto

	?f <- (saltosPequeñosContraalto ?c)
	(nota_melodia (tono ?t1) (voz 2) (indice ?i))
	(nota_melodia (tono ?t2) (voz 2) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 2) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosContraalto ?c))
)

(defrule contar_saltos_grandes_ascendentes_contraalto

	?f <- (saltosGrandesContraalto ?c)
	(nota_melodia (tono ?t1) (voz 2) (indice ?i))
	(nota_melodia (tono ?t2) (voz 2) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 2) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesContraalto ?c))
)

(defrule contar_saltos_grandes_descendentes_contraalto

	?f <- (saltosGrandesContraalto ?c)
	(nota_melodia (tono ?t1) (voz 2) (indice ?i))
	(nota_melodia (tono ?t2) (voz 2) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 2) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesContraalto ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TENOR
(defrule contar_saltos_pequeños_ascendentes_tenor

	?f <- (saltosPequeñosTenor ?c)
	(nota_melodia (tono ?t1) (voz 3) (indice ?i))
	(nota_melodia (tono ?t2) (voz 3) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 3) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosTenor ?c))
)

(defrule contar_saltos_pequeños_descendentes_tenor

	?f <- (saltosPequeñosTenor ?c)
	(nota_melodia (tono ?t1) (voz 3) (indice ?i))
	(nota_melodia (tono ?t2) (voz 3) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 3) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosTenor ?c))
)

(defrule contar_saltos_grandes_ascendentes_tenor

	?f <- (saltosGrandesTenor ?c)
	(nota_melodia (tono ?t1) (voz 3) (indice ?i))
	(nota_melodia (tono ?t2) (voz 3) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 3) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesTenor ?c))
)

(defrule contar_saltos_grandes_descendentes_tenor
	?f <- (saltosGrandesTenor ?c)
	(nota_melodia (tono ?t1) (voz 3) (indice ?i))
	(nota_melodia (tono ?t2) (voz 3) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 3) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesTenor ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BAJO
(defrule contar_saltos_pequeños_ascendentes_bajo

	?f <- (saltosPequeñosBajo ?c)
	(nota_melodia (tono ?t1) (voz 4) (indice ?i))
	(nota_melodia (tono ?t2) (voz 4) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 4) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosBajo ?c))
)

(defrule contar_saltos_pequeños_descendentes_bajo

	?f <- (saltosPequeñosBajo ?c)
	(nota_melodia (tono ?t1) (voz 4 (indice ?i))
	(nota_melodia (tono ?t2) (voz 4 (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz 4) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(<= ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosPequeñosBajo ?c))
)

(defrule contar_saltos_grandes_ascendentes_bajo

	?f <- (saltosGrandesBajo ?c)
	(nota_melodia (tono ?t1) (voz 4) (indice ?i))
	(nota_melodia (tono ?t2) (voz 4) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo ascendente) (voz 4) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesBajo ?c))
)

(defrule contar_saltos_grandes_descendentes_bajo

	?f <- (saltosGrandesBajo ?c)
	(nota_melodia (tono ?t1) (voz 4) (indice ?i))
	(nota_melodia (tono ?t2) (voz 4) (indice ?j))
	(test(eq ?j (+ ?i 1)))
	(movimiento (tipo descendente) (voz41) (indice ?i))
	(intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
	(test(> ?d 4))
	=>
	(retract ?f)
	(bind ?c (+ ?c 1))
	(assert(saltosGrandesBajo ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reglas para comprobar que las melodías soprano, contraalto y tenor son coherentes

(defrule saltos_melodia_soprano
	(saltosGrandesSoprano ?a)
	(saltosPequeñosSoprano ?b)
	(>= ?a ?b)
	=>
	(assert(fallo (tipo melodia_incoherente) (voz1 1) (voz2 1) (indice 1)))
)

(defrule saltos_melodia_contraalto
	(saltosGrandesContraalto ?a)
	(saltosPequeñosContraalto ?b)
	(>= ?a ?b)
	=>
	(assert(fallo (tipo melodia_incoherente) (voz1 2) (voz2 2) (indice 1)))
)

(defrule saltos_melodia_tenor
	(saltosGrandesTenor ?a)
	(saltosPequeñosTenor ?b)
	(>= ?a ?b)
	=>
	(assert(fallo (tipo melodia_incoherente) (voz1 3) (voz2 3) (indice 1)))
)

; Regla para comprobar que no hay dos saltos grandes consecutivos en cualquier voz excepto el bajo
(defrule comprobar_saltos_grandes_consecutivos_ascendentes

	(nota_melodia (tono ?t1) (voz ?v) (indice ?i))
	(nota_melodia (tono ?t2) (voz ?v) (indice ?j))
	(nota_melodia (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?j (+ ?i 1)))
	(test(eq ?k (+ ?j 1)))
	(test(neq ?v 4))
	(movimiento (tipo ascendente) (voz ?v) (indice ?i))
	(movimiento (tipo ascendente) (voz ?v) (indice ?j))
	(intervalo (distancia ?d1) (nota1 ?t1) (nota2 ?t2))
	(intervalo (distancia ?d2) (nota1 ?t2) (nota2 ?t3))
	(test(> ?d1 4))
	(test(> ?d2 4))
	=>
	(assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (indice ?i)))
)

(defrule comprobar_saltos_grandes_consecutivos_descendentes

	(nota_melodia (tono ?t1) (voz ?v) (indice ?i))
	(nota_melodia (tono ?t2) (voz ?v) (indice ?j))
	(nota_melodia (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?j (+ ?i 1)))
	(test(eq ?k (+ ?j 1)))
	(test(neq ?v 4))
	(movimiento (tipo descendente) (voz ?v) (indice ?i))
	(movimiento (tipo descendente) (voz ?v) (indice ?j))
	(intervalo (distancia ?d1) (nota1 ?t1) (nota2 ?t2))
	(intervalo (distancia ?d2) (nota1 ?t2) (nota2 ?t3))
	(test(> ?d1 4))
	(test(> ?d2 4))
	=>
	(assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (indice ?i)))
)

(defrule comprobar_saltos_grandes_consecutivos_ascendente_descendente

	(nota_melodia (tono ?t1) (voz ?v) (indice ?i))
	(nota_melodia (tono ?t2) (voz ?v) (indice ?j))
	(nota_melodia (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?j (+ ?i 1)))
	(test(eq ?k (+ ?j 1)))
	(test(neq ?v 4))
	(movimiento (tipo ascendente) (voz ?v) (indice ?i))
	(movimiento (tipo descendente) (voz ?v) (indice ?j))
	(intervalo (distancia ?d1) (nota1 ?t1) (nota2 ?t2))
	(intervalo (distancia ?d2) (nota1 ?t3) (nota2 ?t1))
	(test(> ?d1 4))
	(test(> ?d2 4))
	=>
	(assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (indice ?i)))
)

(defrule comprobar_saltos_grandes_consecutivos_descendente_ascendente

	(nota_melodia (tono ?t1) (voz ?v) (indice ?i))
	(nota_melodia (tono ?t2) (voz ?v) (indice ?j))
	(nota_melodia (tono ?t3) (voz ?v) (indice ?k))
	(test(eq ?j (+ ?i 1)))
	(test(eq ?k (+ ?j 1)))
	(test(neq ?v 4))
	(movimiento (tipo descendente) (voz ?v) (indice ?i))
	(movimiento (tipo ascendente) (voz ?v) (indice ?j))
	(intervalo (distancia ?d1) (nota1 ?t2) (nota2 ?t1))
	(intervalo (distancia ?d2) (nota1 ?t2) (nota2 ?t3))
	(test(> ?d1 4))
	(test(> ?d2 4))
	=>
	(assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (indice ?i)))
)