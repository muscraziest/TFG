;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                        MÓDULO 2                           ;;;
;;; Resolución sensibles, contrapunto, tritonos melódicos     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                   HECHOS ASERTADOS                        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Regla para abrir el fichero de las tonalidades
(defrule abrir_plantilla_tonalidades
    (declare (salience 20))
    =>
    (open "./tfg_web/reglas/plantilla_tonalidades" mydata_tonalidades)
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
    (open "./tfg_web/reglas/plantilla_intervalos" mydata_intervalos)
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


; Regla para abrir el fichero de los intervalos consonantes
(defrule abrir_plantilla_intervalos_consonantes
    (declare (salience 20))
    =>
    (open "./tfg_web/reglas/plantilla_intervalos_consonantes" mydata_intervalos_consonantes)
    (assert (SeguirLeyendoIntervalosConsonantes))
)

; Regla para leer los intervalos consonantes
(defrule leer_intervalos_consonantes
    ?f <- (SeguirLeyendoIntervalosConsonantes)
    =>
    (bind ?distancia (read mydata_intervalos_consonantes))
    (retract ?f)
    (if (neq ?distancia EOF) then
        (bind ?tipo (read mydata_intervalos_consonantes))
        (assert (intervalo_consonante (distancia ?distancia) (tipo ?tipo)))
        (assert (SeguirLeyendoIntervalosConsonantes))
    )
)

; Regla para abrir el fichero de los intervalos disonantes
(defrule abrir_plantilla_intervalos_disonantes
    (declare (salience 20))
    =>
    (open "./tfg_web/reglas/plantilla_intervalos_disonantes" mydata_intervalos_disonantes)
    (assert (SeguirLeyendoIntervalosDisonantes))
)

; Regla para leer los intervalos disonantes
(defrule leer_intervalos_disonantes
    ?f <- (SeguirLeyendoIntervalosDisonantes)
    =>
    (bind ?distancia (read mydata_intervalos_disonantes))
    (retract ?f)
    (if (neq ?distancia EOF) then
        (bind ?tipo (read mydata_intervalos_disonantes))
        (assert (intervalo_disonante (distancia ?distancia) (tipo ?tipo)))
        (assert (SeguirLeyendoIntervalosDisonantes))
    )
)

; Regla para abrir el fichero de las escalas
(defrule abrir_plantilla_escalas
    (declare (salience 20))
    =>
    (open "./tfg_web/reglas/plantilla_escalas" mydata_escalas)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;             HECHOS DEDUCIDOS              ;;;
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
;;;             HECHOS CALCULADOS             ;;;
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

; Regla para abrir el fichero del compas
(defrule abrir_compas
    (declare (salience 20))
    =>
    (open "./tfg_web/datos/compas" mydata_compas)
    (assert (SeguirLeyendoCompas))
)

;Regla para leer el compas
(defrule leer_compas
    ?f <- (SeguirLeyendoCompas)
    =>
    (bind ?parte (read mydata_compas))
    (retract ?f)
    (if (neq ?parte EOF) then
        (bind ?tipo (read mydata_compas))
        (assert (compas (parte ?parte) (tipo ?tipo)))
        (assert (SeguirLeyendoCompas))
    )
)

; Regla para abrir el fichero de la melodía de la soprano
(defrule abrir_melodia_soprano
    (declare (salience 10))
    =>
    (open "./tfg_web/datos/soprano_melodia" mydata_melodia_soprano)
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
    (open "./tfg_web/datos/contraalto_melodia" mydata_melodia_contraalto)
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
    (open "./tfg_web/datos/tenor_melodia" mydata_melodia_tenor)
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
    (open "./tfg_web/datos/bajo_melodia" mydata_melodia_bajo)
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

; Regla para abrir el fichero de los movimientos la soprano
(defrule abrir_movimientos_soprano
    (declare (salience 10))
    =>
    (open "./tfg_web/datos/soprano_movimientos_m" mydata_mov_soprano)
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
    (open "./tfg_web/datos/contraalto_movimientos_m" mydata_mov_contraalto)
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
    (open "./tfg_web/datos/tenor_movimientos_m" mydata_mov_tenor)
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
    (open "./tfg_web/datos/bajo_movimientos_m" mydata_mov_bajo)
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
    (close mydata_compas)
    (close mydata_melodia_soprano)
    (close mydata_melodia_contraalto)
    (close mydata_melodia_tenor)
    (close mydata_melodia_bajo)
    (close mydata_mov_soprano)
    (close mydata_mov_contraalto)
    (close mydata_mov_tenor)
    (close mydata_mov_bajo)
    (close mydata_tonalidades)
    (close mydata_intervalos)
    (close mydata_intervalos_consonantes)
    (close mydata_intervalos_disonantes)
    (close mydata_escalas)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RESOLUCIÓN SENSIBLES Y SÉPTIMAS, SEGUNDAS AUMENTADAS Y TRITONOS

; Regla para comprobar que la sensible resuelve
(defrule comprobar_sensibles_resueltas

    (nota_melodia (tono ?t1) (voz ?v1) (indice ?i1))
    (nota_melodia (tono ?t2) (voz ?v1) (indice ?i2))
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
    (nota_melodia (tono ?septima) (voz ?v) (indice ?i))
    (nota_melodia (tono ?t) (voz ?v) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (test(neq ?tercera ?t))
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
; CONTRAPUNTO BAJO-SOPRANO

; Reglas para contar los tipos de movimientos: contrario, directo y oblicuos
(defrule contar_mov_contrarios_1

    (movimiento (tipo ascendente) (voz 1) (indice ?i))
    (movimiento (tipo descendente) (voz 4) (indice ?i))
    =>
    (assert (sumarContrarios))
)

(defrule contar_mov_contrarios_2

    (movimiento (tipo descendente) (voz 1) (indice ?i))
    (movimiento (tipo ascendente) (voz 4) (indice ?i))
    =>
    (assert(sumarContrarios))
)

(defrule contar_mov_directos_1

    (movimiento (tipo ascendente) (voz 1) (indice ?i))
    (movimiento (tipo ascendente) (voz 4) (indice ?i))
    =>
    (assert (sumarDirectos))
)

(defrule contar_mov_directos_2

    (movimiento (tipo descendente) (voz 1) (indice ?i))
    (movimiento (tipo descendente) (voz 4) (indice ?i))
    =>
    (assert (sumarDirectos))
)

(defrule contar_mov_oblicuos_1

    (movimiento (tipo mantiene) (voz 1) (indice ?i))
    (movimiento (tipo descendente) (voz 4) (indice ?i))
    =>
    (assert (sumarOblicuos))
)

(defrule contar_mov_oblicuos_2

    (movimiento (tipo mantiene) (voz 1) (indice ?i))
    (movimiento (tipo ascendente) (voz 4) (indice ?i))
    =>
    (assert (sumarOblicuos))
)

(defrule contar_mov_oblicuos_3

    (movimiento (tipo descendente) (voz 1) (indice ?i))
    (movimiento (tipo mantiene) (voz 4) (indice ?i))
    =>
    (assert (sumarOblicuos))
)

(defrule contar_mov_oblicuos_4

    (movimiento (tipo ascendente) (voz 1) (indice ?i))
    (movimiento (tipo mantiene) (voz 4) (indice ?i))
    =>
    (assert (sumarOblicuos))
)

(defrule sumarContadorContrarios
        ?a <-(sumarContrarios)
        ?f <- (movContrariosExtremos ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(movContrariosExtremos ?c))
)

(defrule sumarContadorDirectos
        ?a <-(sumarDirectos)
        ?f <- (movDirectosExtremos ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(movDirectosExtremos ?c ))
)

(defrule sumarContadorOblicuos
        ?a <-(sumarOblicuos)
        ?f <- (movOblicuosExtremos ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(movOblicuosExtremos  ?c ))
)

; Regla para comprobar el contrapunto BAJO-SOPRANO
(defrule contrapunto_bajo_soprano

    (movDirectosExtremos ?directos)
    (movContrariosExtremos ?contrarios)
    (movOblicuosExtremos ?oblicuos)
    (test(< ?contrarios ?directos))
    (test(< ?contrarios ?oblicuos))
    =>
    (assert(fallo (tipo contrapunto_voces_extremas) (voz1 1) (voz2 2) (tiempo 1)))
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
    (intervalo (distancia ?d3) (tipo ?tipo) (nota1 ?t1) (nota2 ?t3))
    (test(>= ?d1 3))
    (test(>= ?d2 3))
    (intervalo_disonante (distancia ?d3) (tipo ?tipo))
    =>
    (assert(fallo (tipo contrapunto_salto_ascendente) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
)

(defrule comprobar_contrapunto_salto_descendente

    (nota_melodia (tono ?t1) (voz ?v) (indice ?i))
    (nota_melodia (tono ?t2) (voz ?v) (indice ?j))
    (nota_melodia (tono ?t3) (voz ?v) (indice ?k))
    (test(eq ?j (+ ?i 1)))
    (test(eq ?k (+ ?j 1)))
    (movimiento (tipo descendente) (voz ?v) (indice ?i))
    (movimiento (tipo descendente) (voz ?v) (indice ?j))
    (intervalo (distancia ?d1) (nota1 ?t2) (nota2 ?t1))
    (intervalo (distancia ?d2) (nota1 ?t3) (nota2 ?t2))
    (intervalo (distancia ?d3) (tipo ?tipo) (nota1 ?t3) (nota2 ?t1))
    (test(>= ?d1 3))
    (test(>= ?d2 3))
    (intervalo_disonante (distancia ?d3) (tipo ?tipo))
    =>
    (assert(fallo (tipo contrapunto_salto_descendente) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SALTOS MELÓDICOS
; Reglas para contar los tipos de saltos en las melodías

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SOPRANO
(defrule contar_saltos_pekenos_ascendentes_soprano

    (nota_melodia (tono ?t1) (voz 1) (indice ?i))
    (nota_melodia (tono ?t2) (voz 1) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo ascendente) (voz 1) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
    (test(<= ?d 4))
    =>
    (assert (sumarSaltosPSoprano))
)

(defrule contar_saltos_pekenos_descendentes_soprano

    (nota_melodia (tono ?t1) (voz 1) (indice ?i))
    (nota_melodia (tono ?t2) (voz 1) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo descendente) (voz 1) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
    (test(<= ?d 4))
    =>
    (assert (sumarSaltosPSoprano))
)

(defrule contar_saltos_grandes_ascendentes_soprano

    (nota_melodia (tono ?t1) (voz 1) (indice ?i))
    (nota_melodia (tono ?t2) (voz 1) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo ascendente) (voz 1) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
    (test(> ?d 4))
    =>
    (assert (sumarSaltosGSoprano))
)

(defrule contar_saltos_grandes_descendentes_soprano

    (nota_melodia (tono ?t1) (voz 1) (indice ?i))
    (nota_melodia (tono ?t2) (voz 1) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo descendente) (voz 1) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
    (test(> ?d 4))
    =>
    (assert (sumarSaltosGSoprano))
)

(defrule sumarSaltosPSoprano
        ?a <-(sumarSaltosPSoprano)
        ?f <- (saltosPekenosSoprano ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(saltosPekenosSoprano ?c))
)

(defrule sumarSaltosGSoprano
        ?a <-(sumarSaltosGSoprano)
        ?f <- (saltosGrandesSoprano ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(saltosGrandesSoprano ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONTRAALTO
(defrule contar_saltos_pekenos_ascendentes_contraalto

    (nota_melodia (tono ?t1) (voz 2) (indice ?i))
    (nota_melodia (tono ?t2) (voz 2) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo ascendente) (voz 2) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
    (test(<= ?d 4))
    =>
    (assert (sumarSaltosPContraalto))
)

(defrule contar_saltos_pekenos_descendentes_contraalto

    (nota_melodia (tono ?t1) (voz 2) (indice ?i))
    (nota_melodia (tono ?t2) (voz 2) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo descendente) (voz 2) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
    (test(<= ?d 4))
    =>
    (assert (sumarSaltosPContraalto))
)

(defrule contar_saltos_grandes_ascendentes_contraalto

    (nota_melodia (tono ?t1) (voz 2) (indice ?i))
    (nota_melodia (tono ?t2) (voz 2) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo ascendente) (voz 2) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
    (test(> ?d 4))
    =>
    (assert (sumarSaltosGContraalto))
)

(defrule contar_saltos_grandes_descendentes_contraalto

    (nota_melodia (tono ?t1) (voz 2) (indice ?i))
    (nota_melodia (tono ?t2) (voz 2) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo descendente) (voz 2) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
    (test(> ?d 4))
    =>
    (assert (sumarSaltosGContraalto))
)

(defrule sumarSaltosPContraalto
        ?a <-(sumarSaltosPContraalto)
        ?f <- (saltosPekenosContraalto ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(saltosPekenosContraalto ?c))
)


(defrule sumarSaltosGContraalto
        ?a <-(sumarSaltosGContraalto)
        ?f <- (saltosGrandesContraalto ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(saltosGrandesContraalto ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TENOR
(defrule contar_saltos_pekenos_ascendentes_tenor

    (nota_melodia (tono ?t1) (voz 3) (indice ?i))
    (nota_melodia (tono ?t2) (voz 3) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo ascendente) (voz 3) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
    (test(<= ?d 4))
    =>
    (assert (sumarSaltosPTenor))
)

(defrule contar_saltos_pekenos_descendentes_tenor

    (nota_melodia (tono ?t1) (voz 3) (indice ?i))
    (nota_melodia (tono ?t2) (voz 3) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo descendente) (voz 3) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
    (test(<= ?d 4))
    =>
    (assert (sumarSaltosPTenor))
)

(defrule contar_saltos_grandes_ascendentes_tenor

    (nota_melodia (tono ?t1) (voz 3) (indice ?i))
    (nota_melodia (tono ?t2) (voz 3) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo ascendente) (voz 3) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t1) (nota2 ?t2))
    (test(> ?d 4))
    =>
    (assert (sumarSaltosGTenor))
)

(defrule contar_saltos_grandes_descendentes_tenor

    (nota_melodia (tono ?t1) (voz 3) (indice ?i))
    (nota_melodia (tono ?t2) (voz 3) (indice ?j))
    (test(eq ?j (+ ?i 1)))
    (movimiento (tipo descendente) (voz 3) (indice ?i))
    (intervalo (distancia ?d) (nota1 ?t2) (nota2 ?t1))
    (test(> ?d 4))
    =>
    (assert (sumarSaltosGTenor))
)

(defrule sumarSaltosPTenor
        ?a <-(sumarSaltosPTenor)
        ?f <- (saltosPekenosTenor ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(saltosPekenosTenor ?c))
)

(defrule sumarSaltosGTenor
        ?a <-(sumarSaltosGTenor)
        ?f <- (saltosGrandesTenor ?c)
        =>
        (retract ?a)
        (retract ?f)
        (bind ?c (+ ?c 1))
        (assert(saltosGrandesTenor ?c))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reglas para comprobar que las melodías soprano, contraalto y tenor son coherentes

(defrule saltos_melodia_soprano
    (saltosGrandesSoprano ?a)
    (saltosPekenosSoprano ?b)
    (>= ?a ?b)
    =>
    (assert(fallo (tipo melodia_incoherente) (voz1 1) (voz2 1) (tiempo 1)))
)

(defrule saltos_melodia_contraalto
    (saltosGrandesContraalto ?a)
    (saltosPekenosContraalto ?b)
    (>= ?a ?b)
    =>
    (assert(fallo (tipo melodia_incoherente) (voz1 2) (voz2 2) (tiempo 1)))
)

(defrule saltos_melodia_tenor
    (saltosGrandesTenor ?a)
    (saltosPekenosTenor ?b)
    (>= ?a ?b)
    =>
    (assert(fallo (tipo melodia_incoherente) (voz1 3) (voz2 3) (tiempo 1)))
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
    (assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
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
    (assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
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
    (assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
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
    (assert(fallo (tipo melodia_incoherente_saltos_grandes) (voz1 ?v) (voz2 ?v) (tiempo ?i)))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                    MOSTRAR FALLOS                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Regla auxiliar para comprobar el numero de partes del compas
(defrule partesCompas
    (compas (parte ?p) (tipo ?t))
    =>
    (if (= ?t 4) then
        (bind ?a (* ?p ?t))
        (assert(semicorcheas ?a))
    )

    (if (= ?t 8) then
        (bind ?a (* ?p 2))
        (assert(semicorcheas ?a))
    )
)

(defrule mostrar_resolucion_sensible

    (declare (salience -10000))
    (fallo (tipo resolucion_sensible) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    (compas (parte ?p))
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (bind ?parte (+ (div (mod ?i ?a) ?p) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En el compás " ?compas " en la parte " ?parte " la sensible en la voz " ?voz1 " no resuelve. La sensible es una nota que provoca inestabilidad y que se siente atraída por resolver en la tónica de la tonalidad. Al no estar resuelta, esa inestabilidad se mantiene provocando una falta de coherencia en la línea melódica.." )
    (close data)
)

(defrule mostrar_resolucion_septima

    (declare (salience -10000))
    (fallo (tipo resolucion_septima) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    (compas (parte ?p))
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (bind ?parte (+ (div (mod ?i ?a) ?p) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En el compás " ?compas " en la parte " ?parte " la voz " ?voz1 " no resuelve. La séptima es una nota que provoca inestabilidad y tensión, por lo que se siente atraída por resolver en la tercera de la tónica de la tonalidad para eliminar esa tensión. Al no resolver esta inestabilidad se mantiene provocando una falta de coherencia en la línea melódica..")
    (close data)
)

(defrule mostrar_segunda_aumentada_melodica

    (declare (salience -10000))
    (fallo (tipo segunda_aumentada_melodica) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    (compas (parte ?p))
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (bind ?parte (+ (div (mod ?i ?a) ?p) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En el compás " ?compas " en la parte " ?parte " en melodía de la voz " ?voz1 " hay una intervalo de segunda aumentada. El intervalo de segunda aumentada provoca una sonoridad extraña y tensión, sobre todo en modo mayor, por lo que debe ser evitada para cuidar la línea melódica.." )
    (close data)
)

(defrule mostrar_tritono_melodico

    (declare (salience -10000))
    (fallo (tipo tritono_melodico) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    (compas (parte ?p))
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (bind ?parte (+ (div (mod ?i ?a) ?p) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En el compás " ?compas " en la parte " ?parte " en la melodía de la voz " ?voz1 " hay una intervalo de tritono. El intervalo de cuarta aumentada o tritono es un intervalo disonante que crea mucha tensión, por lo cual es un intervalo prohibido dentro de este estilo de obras.." )
    (close data)
)

(defrule mostrar_contrapunto_voces_extremas

    (declare (salience -10000))
    (fallo (tipo contrapunto_voces_extremas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    (compas (parte ?p))
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (bind ?parte (+ (div (mod ?i ?a) ?p) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En general, en la obra no hay un buen contrapunto entre las voces extremas. Hay demasiados movimientos directos u oblicuos en comparación con el movimiento contrario que debería predominar para que las líneas melódicas queden cuidadas y \equilibradas.." )
    (close data)
)

(defrule mostrar_contrapunto_saltos_1

    (declare (salience -10000))
    (fallo (tipo contrapunto_salto_ascendente) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En el compas " ?compas " hay disonancias entre notas con saltos ascendetes en la melodía de la voz " ?voz1 ". Hay dos saltos consecutivos en los cuales la primera nota y la última son disonantes, lo cual provoca inestabilidad en la melodía.." )
    (close data)
)

(defrule mostrar_contrapunto_saltos_2

    (declare (salience -10000))
    (fallo (tipo contrapunto_salto_descendente) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "En el compas " ?compas " hay disonancias entre notas con saltos descendentes en la melodía de la voz " ?voz1 ". Hay dos saltos consecutivos en los cuales la primera nota y la última son disonantes, lo cual provoca inestabilidad en la melodía.." )
    (close data)
)

(defrule mostrar_melodia_incoherente

    (declare (salience -10000))
    (fallo (tipo melodia_incoherente) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "La melodía de la voz " ?voz1 " es bastante incoherente. Se producen demasiados saltos en la línea melódica, lo que hace que el discurso musical pierda fluidez y coherencia.." )
    (close data)
)

(defrule mostrar_melodia_incoherente_saltos

    (declare (salience -10000))
    (fallo (tipo melodia_incoherente) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (+ (div ?i ?a) 1) 1))
    (if (= ?v1 1) then
        (bind ?voz1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?voz1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?voz1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?voz1 "bajo")
    )
    (open " ./tfg/web/fallos/fallos_mod2" data "a")
    (printout data "La melodía de la voz " ?voz1 " es bastante incoherente en el compás " ?compas " al producirse dos saltos grandes consecutivos. Al producirse demasiados saltos consecutivos la meĺodía pierde fluidez, naturalidad y se desequilibra el discurso musical.." )
    (close data)
)