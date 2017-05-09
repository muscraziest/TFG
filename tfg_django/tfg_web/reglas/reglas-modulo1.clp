;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                        MÓDULO 1                           ;;;
;;; Comprobar fallos de quitas, octavas, tritonos y sensibles ;;;
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

; Regla para abrir el fichero de los movimientos la soprano
(defrule abrir_movimientos_soprano
    (declare (salience 10))
    =>
    (open "./tfg_web/datos/soprano_movimientos_a" mydata_mov_soprano)
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
    (open "./tfg_web/datos/contraalto_movimientos_a" mydata_mov_contraalto)
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
    (open "./tfg_web/datos/tenor_movimientos_a" mydata_mov_tenor)
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
    (open "./tfg_web/datos/bajo_movimientos_a" mydata_mov_bajo)
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
    (close mydata_tonalidades)
    (close mydata_intervalos)
)

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
    (test (neq ?t1 ?t3))
    (intervalo (distancia 5) (nota1 ?t2) (nota2 ?t1))
    (intervalo (distancia 5) (nota1 ?t4) (nota2 ?t3))
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
    (intervalo (distancia 5) (tipo justa) (nota1 ?t2) (nota2 ?t1))
    =>
    (assert (fallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i1)))
)

; Regla para buscar quintas directas 
(defrule buscar_quintas_directas

    (nota (tono ?t1) (voz ?v1) (indice ?i))
    (nota (tono ?t2) (voz ?v2) (indice ?i))
    (intervalo (distancia 5) (nota1 ?t2) (nota2 ?t1))
    =>
    (bind ?indice (- ?i 1))
    (assert (posibleFallo (tipo quintas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i)))
)

; Compramos las posibles quintas directas
(defrule comprobar_quintas_directas

    (posibleFallo (tipo quintas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (nota (voz ?v1) (indice ?i0))
    (test (= ?i0 (- ?i 1)))
    (or 
        (and (exists (movimiento (tipo ascendente) (voz ?v1) (indice ?i0)))
             (exists (movimiento (tipo ascendente) (voz ?v2) (indice ?i0)))
        )

        (and (exists (movimiento (tipo descendente) (voz ?v1) (indice ?i0)))
             (exists (movimiento (tipo descendente) (voz ?v2) (indice ?i0)))
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
    (test (neq ?t1 ?t3))
    (intervalo (distancia 8) (nota1 ?t2) (nota2 ?t1))
    (intervalo (distancia 8) (nota1 ?t4) (nota2 ?t3))
        
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                    MOSTRAR FALLOS                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reglas para mostrar los tipos de fallos
(defrule mostrar_quintas

    (declare (salience -10000))
    (fallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (bind ?compas (/ ?i 12))
    (bind ?parte (/ (mod ?i 12) 2))
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "Hay quintas paralelas en las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ". Las quintas paralelas provocan una sonoridad dura y arcaica, lo cual está completamente fuera de estilo..") 
    (close data)
)

(defrule mostrar_octavas

    (declare (salience -10000))
    (fallo (tipo octavas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (bind ?compas (/ ?i 12))
    (bind ?parte (/ (mod ?i 12) 2))
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "Hay octavas paralelas en las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ". Las octavas paralelas generan pobreza armónica y sonoridad hueca..")
    (close data)
)

(defrule mostrar_quintas_directas

    (declare (salience -10000))
    (fallo (tipo quintas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (bind ?compas (/ ?i 12))
    (bind ?parte (/ (mod ?i 12) 2))
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "Hay quintas directas en las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ". Las quintas directas provocan que se pierda la independencia de las partes y un contrapunto pobre..")
    (close data)
)

(defrule mostrar_octavas_directas

    (declare (salience -10000))
    (fallo (tipo octavas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (bind ?compas (/ ?i 12))
    (bind ?parte (/ (mod ?i 12) 2))
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "Hay octavas directas en voces extremas en la " ?parte " parte del compas " ?compas ". Las octavas directas provocan que se pierda la independencia de las partes y un contrapunto pobre..")
    (close data)
)

(defrule mostrar_tritono

    (declare (salience -10000))
    (fallo (tipo tritono) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (bind ?compas (/ ?i 12))
    (bind ?parte (/ (mod ?i 12) 2))
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "Hay un tritono entre las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ". El intervalo de cuarta aumentada o tritono es un intervalo disonante que crea mucha tensión, por lo cual es un intervalo prohibido dentro de este estilo de obras.")
    (close data)
)

(defrule mostrar_duplicacion_sensibles

    (declare (salience -10000))
    (fallo (tipo duplicacion_sensible) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    =>
    (bind ?compas (/ ?i 12))
    (bind ?parte (/ (mod ?i 12) 2))
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "Las voces " ?v1 " y " ?v2 " duplican la sensible de la tonalidad en la " ?parte " del compas " ?compas ". La sensible es una nota que provoca inestabilidad y que se siente atraída por resolver en la tónica de la tonalidad. Al duplicar la sensible generaremos octavas paralelas, lo cual es una falta que no se puede dar en este estilo de obras..")
    (close data)
)