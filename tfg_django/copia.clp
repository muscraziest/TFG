
(defrule mostrar_octavas

    (declare (salience -10000))
    (fallo (tipo octavas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (div ?i ?a) 1))
    (bind ?parte (mod ?i ?a))
    (if (= ?v1 1) then
        (bind ?v1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?v1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?v1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?v1 "bajo")
    )
    (if (= ?v2 1) then
        (bind ?v2 "soprano")
    )
    (if (= ?v2 2) then
        (bind ?v2 "contraalto")
    )
    (if (= ?v2 3) then
        (bind ?v2 "tenor")
    )
    (if (= ?v2 4) then
        (bind ?v2 "bajo")
    )
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "En el compás " ?compas? " en la parte " ?parte " hay octavas paralelas en las voces " ?v1 " y " ?v2 ". Las octavas paralelas generan pobreza armónica y sonoridad hueca..")
    (close data)
)

(defrule mostrar_quintas_directas

    (declare (salience -10000))
    (fallo (tipo quintas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (div ?i ?a) 1))
    (bind ?parte (mod ?i ?a))
    (if (= ?v1 1) then
        (bind ?v1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?v1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?v1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?v1 "bajo")
    )
    (if (= ?v2 1) then
        (bind ?v2 "soprano")
    )
    (if (= ?v2 2) then
        (bind ?v2 "contraalto")
    )
    (if (= ?v2 3) then
        (bind ?v2 "tenor")
    )
    (if (= ?v2 4) then
        (bind ?v2 "bajo")
    )
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "En el compás " ?compas? " en la parte " ?parte " hay quintas directas en las voces " ?v1 " y " ?v2 ". Las quintas directas provocan que se pierda la independencia de las partes y un contrapunto pobre..")
    (close data)
)

(defrule mostrar_octavas_directas

    (declare (salience -10000))
    (fallo (tipo octavas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (div ?i ?a) 1))
    (bind ?parte (mod ?i ?a))
    (if (= ?v1 1) then
        (bind ?v1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?v1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?v1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?v1 "bajo")
    )
    (if (= ?v2 1) then
        (bind ?v2 "soprano")
    )
    (if (= ?v2 2) then
        (bind ?v2 "contraalto")
    )
    (if (= ?v2 3) then
        (bind ?v2 "tenor")
    )
    (if (= ?v2 4) then
        (bind ?v2 "bajo")
    )
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "En el compás " ?compas? " en la parte " ?parte " hay octavas directas en las voces " ?v1 " y " ?v2 ". Las octavas directas provocan que se pierda la independencia de las partes y un contrapunto pobre..")
    (close data)
)

(defrule mostrar_tritono

    (declare (salience -10000))
    (fallo (tipo tritono) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (div ?i ?a) 1))
    (bind ?parte (mod ?i ?a))
    (if (= ?v1 1) then
        (bind ?v1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?v1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?v1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?v1 "bajo")
    )
    (if (= ?v2 1) then
        (bind ?v2 "soprano")
    )
    (if (= ?v2 2) then
        (bind ?v2 "contraalto")
    )
    (if (= ?v2 3) then
        (bind ?v2 "tenor")
    )
    (if (= ?v2 4) then
        (bind ?v2 "bajo")
    )
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "En el compás " ?compas? " en la parte " ?parte " hay un tritono entre las voces " ?v1 " y " ?v2 ". El intervalo de cuarta aumentada o tritono es un intervalo disonante que crea mucha tensión, por lo cual es un intervalo prohibido dentro de este estilo de obras..")
    (close data)
)

(defrule mostrar_duplicacion_sensibles

    (declare (salience -10000))
    (fallo (tipo duplicacion_sensible) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
    (semicorcheas ?a)
    =>
    (bind ?compas (+ (div ?i ?a) 1))
    (bind ?parte (mod ?i ?a))
    (if (= ?v1 1) then
        (bind ?v1 "soprano")
    )
    (if (= ?v1 2) then
        (bind ?v1 "contraalto")
    )
    (if (= ?v1 3) then
        (bind ?v1 "tenor")
    )
    (if (= ?v1 4) then
        (bind ?v1 "bajo")
    )
    (if (= ?v2 1) then
        (bind ?v2 "soprano")
    )
    (if (= ?v2 2) then
        (bind ?v2 "contraalto")
    )
    (if (= ?v2 3) then
        (bind ?v2 "tenor")
    )
    (if (= ?v2 4) then
        (bind ?v2 "bajo")
    )
    (open "./tfg_web/fallos/fallos_mod1" data "a") 
    (printout data "En el compás " ?compas? " en la parte " ?parte " las voces " ?v1 " y " ?v2 " duplican la sensible de la tonalidad. La sensible es una nota que provoca inestabilidad y que se siente atraída por resolver en la tónica de la tonalidad. Al duplicar la sensible generaremos octavas paralelas, lo cual es una falta que no se puede dar en este estilo de obras..")
    (close data)
)