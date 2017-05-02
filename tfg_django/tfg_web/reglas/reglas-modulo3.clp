;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                         MÓDULO 3                          ;;;
;;;                     Análisis armónico                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     HECHOS ASERTADOS                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Regla para abrir el fichero de las tonalidades
(defrule abrir_plantilla_tonalidades
        (declare (salience 20))
        =>
        (open "plantilla_tonalidades" mydata_tonalidades)
        (assert (SeguirLeyendoTonalidades))
)

; Regla para leer las tonalidades
(defrule leer_tonalidades
        ?f <- (SeguirLeyendoTonalidades)
        =>
        (bind ?nombre (read mydata_tonalidades))
        (retract ?f)
        (if (neq ?nombre EOF) then
                (bind ?modo (read mydata_tonalidades))
                (bind ?armadura (read mydata_tonalidades))
                (bind ?sensible (read mydata_tonalidades))
                (assert (tonalidad (nombre ?nombre) (modo ?modo) (armadura ?armadura) (sensible ?sensible)))
                (assert (SeguirLeyendoTonalidades))
        )
)

; Regla para abrir el fichero de los intervalos
(defrule abrir_plantilla_intervalos
        (declare (salience 20))
        =>
        (open "plantilla_intervalos" mydata_intervalos)
        (assert (SeguirLeyendoIntervalos))
)

; Regla para leer los intervalos
(defrule leer_intervalos
        ?f <- (SeguirLeyendoIntervalos)
        =>
        (bind ?distancia (read mydata_intervalos))
        (retract ?f)
        (if (neq ?distancia EOF) then
                (bind ?tipo (read mydata_intervalos))
                (bind ?nota1 (read mydata_intervalos))
                (bind ?nota2 (read mydata_intervalos))
                (assert (intervalo (distancia ?distancia) (tipo ?tipo) (nota1 ?nota1) (nota2 ?nota2)))
                (assert (SeguirLeyendoIntervalos))
        )
)

; Regla para abrir el fichero de las escalas
(defrule abrir_plantilla_escalas
        (declare (salience 20))
        =>
        (open "plantilla_escalas" mydata_escalas)
        (assert (SeguirLeyendoEscalas))
)

; Regla para leer las escalas
(defrule leer_escalas
        ?f <- (SeguirLeyendoEscalas)
        =>
        (bind ?nombre_t (read mydata_escalas))
        (retract ?f)
        (if (neq ?nombre_t EOF) then
                (bind ?modo_t (read mydata_escalas))
                (bind ?gradoI (read mydata_escalas))
                (bind ?gradoII (read mydata_escalas))
                (bind ?gradoIII (read mydata_escalas))
                (bind ?gradoIV (read mydata_escalas))
                (bind ?gradoV (read mydata_escalas))
                (bind ?gradoVI (read mydata_escalas))
                (bind ?gradoVII (read mydata_escalas))
                (assert (escala (nombre_t ?nombre_t) (modo_t ?modo_t) (gradoI ?gradoI) (gradoII ?gradoII) (gradoIII ?gradoIII) (gradoIV ?gradoIV) (gradoV ?gradoV) (gradoVI ?gradoVI) (gradoVII ?gradoVII)))
                (assert (SeguirLeyendoEscalas))
        )
)

; Regla para abrir el fichero de las sucesiones logicas
(defrule abrir_plantilla_sucesiones_logicas
        (declare (salience 20))
        =>
        (open "plantilla_sucesiones_logicas" mydata_sucesiones_logicas)
        (assert (SeguirLeyendoSucesionesLogicas))
)

; Regla para leer las sucesiones logicas
(defrule leer_sucesiones_logicas
        ?f <- (SeguirLeyendoSucesionesLogicas)
        =>
        (bind ?acorde1 (read mydata_sucesiones_logicas))
        (retract ?f)
        (if (neq ?acorde1 EOF) then
                (bind ?acorde2 (read mydata_sucesiones_logicas))
                (assert (sucesion_logica (acorde1 ?acorde1) (acorde2 ?acorde2)))
                (assert (SeguirLeyendoSucesionesLogicas))
        )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     HECHOS DEDUCIDOS                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;                     HECHOS CALCULADOS                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hechos asertados a partir del conocimiento extraído de la partitura

; Regla para abrir el fichero de la tonalidad
(defrule abrir_tonalidad
        (declare (salience 20))
        =>
        (open "./tfg_web/datos/tonalidad" mydata_tonalidad)
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

; Regla para abrir el fichero de la soprano
(defrule abrir_soprano
        (declare (salience 10))
        =>
        (open "./tfg_web/datos/soprano_acordes" mydata_soprano)
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
        (open "./tfg_web/datos/contraalto_acordes" mydata_contraalto)
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
        (open "./tfg_web/datos/tenor_acordes" mydata_tenor)
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
        (open "./tfg_web/datos/bajo_acordes" mydata_bajo)
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

; Regla para cerrar los ficheros
(defrule cerrar_archivos
        (declare (salience -10))
        =>
        (close mydata_tonalidad)
        (close mydata_soprano)
        (close mydata_contraalto)
        (close mydata_tenor)
        (close mydata_bajo)
        (close mydata_tonalidades)
        (close mydata_intervalos)
        (close mydata_escalas)
        (close mydata_sucesiones_logicas)
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
        (not (sucesion_logica (acorde1 ?g1) (acorde2 ?g2)))
        =>
        (assert (fallo (tipo sucesion_logica) (tiempo ?i)))
)

; Regla para comprobar que no hay dos acordes en segunda inversión consecutivos
(defrule comprobar_segundas_inversiones_consecutivas

        (acorde (grado ?g1) (inversion segunda) (indice ?i))
        (acorde (grado ?g2) (inversion segunda) (indice ?j))
        (test(eq ?j (+ ?i 1)))
        (test(neq ?g1 ?g2))
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
        (test(eq ?j (+ ?i 1)))
        (test(eq ?k (+ ?j 1)))
        (not (sucesion_logica (acorde1 ?g1) (acorde2 ?g2)))
        (not (sucesion_logica (acorde1 ?g2) (acorde2 ?g3)))
        =>
        (assert(serieSextas ?i))
)

; Reglas para comprobar que no hay sucesiones incorrectas como
;       - I-II en estado fundamental
;       - II-III en estado fundamental
;       - III-IV en estado fundamental
(defrule encontrar_sucesion_erronea1

        (acorde (grado I) (inversion fundamental) (indice ?i))
        (acorde (grado II) (inversion fundamental) (indice ?j))
        (test(eq ?j (+ ?i 1)))
        =>
        (assert (fallo (tipo sucesion_acordes_erronea_1) (tiempo ?i)))
)

(defrule encontrar_sucesion_erronea2

        (acorde (grado II) (inversion fundamental) (indice ?i))
        (acorde (grado III) (inversion fundamental) (indice ?j))
        (test(eq ?j (+ ?i 1)))
        =>
        (assert (fallo (tipo sucesion_acordes_erronea_2) (tiempo ?i)))
)

(defrule encontrar_sucesion_erronea3

        (acorde (grado III) (inversion fundamental) (indice ?i))
        (acorde (grado IV) (inversion fundamental) (indice ?j))
        (test(eq ?j (+ ?i 1)))
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

; Regla para comprobar si hay acordes incompletos
(defrule acordes_incompletos

        (acorde (grado ?g) (indice ?i))
        (not(exists(acordeCompleto ?i)))
        =>
        (assert(fallo (tipo acorde_incompleto) (tiempo ?i)))
)

; Reglas para mostrar los tipos de fallos
(defrule mostrar_segundas_inv_consecutivas

        (declare (salience -10000))
        (fallo (tipo segundas_inversiones_consecutivas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "./tfg_web/fallos/fallos_mod3" data "a")
        (printout data "En la " ?parte " parte del compas " ?compas " hay dos acordes en segunda inversión consecutivos.." )
        (close data)
)

(defrule mostrar_sucesion_erronea_1

        (declare (salience -10000))
        (fallo (tipo sucesion_acordes_erronea_1) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "./tfg_web/fallos/fallos_mod3" data "a")
        (printout data "En la " ?parte " parte del compas " ?compas " se da la sucesión de acordes I-II en estado fundamental, la cual es incorrecta.." )
        (close data)
)

(defrule mostrar_sucesion_erronea_2

        (declare (salience -10000))
        (fallo (tipo sucesion_acordes_erronea_2) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "./tfg_web/fallos/fallos_mod3" data "a")
        (printout data "En la " ?parte " parte del compas " ?compas " se da la sucesión de acordes II-III en estado fundamental, la cual es incorrecta.." )
        (close data)
)

(defrule mostrar_sucesion_erronea_3

        (declare (salience -10000))
        (fallo (tipo sucesion_acordes_erronea_3) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "./tfg_web/fallos/fallos_mod3" data "a")
        (printout data "En la " ?parte " parte del compas " ?compas " se da la sucesión de acordes III-Iv en estado fundamental, la cual es incorrecta.." )
        (close data)
)

(defrule mostrar_acordes_incompletos

        (declare (salience -10000))
        (fallo (tipo acordes_incompletos) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "./tfg_web/fallos/fallos_mod3" data "a")
        (printout data "En la " ?parte " parte del " ?compas " hay un acorde incompleto.." )
        (close data)
)