;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                         MÓDULO 1                          ;;;
;;; Comprobar fallos de quitas, octavas, tritonos y sensibles ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     HECHOS ASERTADOS                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Hechos asertados auxiliares
(deffacts contadores
        (contador_soprano 0)
        (contador_contraalto 0)
        (contador_tenor 0)
        (contador_bajo 0)
        (contador_mov_soprano 0)
        (contador_mov_contraalto 0)
        (contador_mov_tenor 0)
        (contador_mov_bajo 0)
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

;INTERVALOS
(deftemplate intervalo
        (slot distancia)
        (slot tipo)
        (slot nota1)
        (slot nota2)
)

(deffacts intervalos
        (intervalo (distancia 2) (tipo menor) (nota1 C) (nota2 Db))     ;Do-Reb
        (intervalo (distancia 2) (tipo menor) (nota1 Cs) (nota2 D))     ;Dos-Re
        (intervalo (distancia 2) (tipo menor) (nota1 Cb) (nota2 Dbb))   ;Dob-Rebb
        (intervalo (distancia 2) (tipo menor) (nota1 D) (nota2 Eb))     ;Re-Mib
        (intervalo (distancia 2) (tipo menor) (nota1 Ds) (nota2 E))     ;Res-Mi
        (intervalo (distancia 2) (tipo menor) (nota1 Db) (nota2 Ebb))   ;Reb-Mibb
        (intervalo (distancia 2) (tipo menor) (nota1 E) (nota2 F))      ;Mi-Fa
        (intervalo (distancia 2) (tipo menor) (nota1 Es) (nota2 Fs))    ;Mis-Fas
        (intervalo (distancia 2) (tipo menor) (nota1 Eb) (nota2 Fb))    ;Mib-Fab
        (intervalo (distancia 2) (tipo menor) (nota1 F) (nota2 Gb))     ;Fa-Solb
        (intervalo (distancia 2) (tipo menor) (nota1 Fs) (nota2 G))     ;Fas-Sol
        (intervalo (distancia 2) (tipo menor) (nota1 Fb) (nota2 Gbb))   ;Fab-Solbb
        (intervalo (distancia 2) (tipo menor) (nota1 G) (nota2 Ab))     ;Sol-Lab
        (intervalo (distancia 2) (tipo menor) (nota1 Gs) (nota2 A))     ;Sols-La
        (intervalo (distancia 2) (tipo menor) (nota1 Gb) (nota2 Abb))   ;Solb-Labb
        (intervalo (distancia 2) (tipo menor) (nota1 A) (nota2 Bb))     ;La-Sib
        (intervalo (distancia 2) (tipo menor) (nota1 As) (nota2 B))     ;Las-Si
        (intervalo (distancia 2) (tipo menor) (nota1 Ab) (nota2 Bbb))   ;Lab-Sibb
        (intervalo (distancia 2) (tipo menor) (nota1 B) (nota2 C))      ;Si-Do
        (intervalo (distancia 2) (tipo menor) (nota1 Bs) (nota2 Cs))    ;Sis-Dos
        (intervalo (distancia 2) (tipo menor) (nota1 Bb) (nota2 Cb))    ;Sib-Dob

        (intervalo (distancia 2) (tipo mayor) (nota1 C) (nota2 D))      ;Do-Re   
        (intervalo (distancia 2) (tipo mayor) (nota1 Cs) (nota2 Ds))    ;Dos-Res
        (intervalo (distancia 2) (tipo mayor) (nota1 Cb) (nota2 Db))    ;Dob-Reb
        (intervalo (distancia 2) (tipo mayor) (nota1 D) (nota2 E))      ;Re-Mi
        (intervalo (distancia 2) (tipo mayor) (nota1 Ds) (nota2 Es))    ;Res-Mis
        (intervalo (distancia 2) (tipo mayor) (nota1 Db) (nota2 Eb))    ;Reb-Mib
        (intervalo (distancia 2) (tipo mayor) (nota1 E) (nota2 Fs))     ;Mi-Fas
        (intervalo (distancia 2) (tipo mayor) (nota1 Es) (nota2 Fss))   ;Mis-Fass
        (intervalo (distancia 2) (tipo mayor) (nota1 Eb) (nota2 F))     ;Mib-Fa
        (intervalo (distancia 2) (tipo mayor) (nota1 F) (nota2 G))      ;Fa-Sol
        (intervalo (distancia 2) (tipo mayor) (nota1 Fs) (nota2 Gs))    ;Fas-Sols
        (intervalo (distancia 2) (tipo mayor) (nota1 Fb) (nota2 Gb))    ;Fab-Solb
        (intervalo (distancia 2) (tipo mayor) (nota1 G) (nota2 A))      ;Sol-La
        (intervalo (distancia 2) (tipo mayor) (nota1 Gs) (nota2 As))    ;Sols-Las
        (intervalo (distancia 2) (tipo mayor) (nota1 Gb) (nota2 Ab))    ;Solb-Lab
        (intervalo (distancia 2) (tipo mayor) (nota1 A) (nota2 B))      ;La-Si
        (intervalo (distancia 2) (tipo mayor) (nota1 As) (nota2 Bs))    ;Las-Sis
        (intervalo (distancia 2) (tipo mayor) (nota1 Ab) (nota2 Bb))    ;Lab-Sib
        (intervalo (distancia 2) (tipo mayor) (nota1 B) (nota2 Cs))     ;Si-Dos
        (intervalo (distancia 2) (tipo mayor) (nota1 Bs) (nota2 Css))   ;Sis-Doss
        (intervalo (distancia 2) (tipo mayor) (nota1 Bb) (nota2 C))     ;Sib-Do

        (intervalo (distancia 2) (tipo aumentada) (nota1 C) (nota2 Ds))         ;Do-Res   
        (intervalo (distancia 2) (tipo aumentada) (nota1 Cs) (nota2 Dss))       ;Dos-Ress
        (intervalo (distancia 2) (tipo aumentada) (nota1 Cb) (nota2 D))         ;Dob-Re
        (intervalo (distancia 2) (tipo aumentada) (nota1 D) (nota2 Es))         ;Re-Mis
        (intervalo (distancia 2) (tipo aumentada) (nota1 Ds) (nota2 Ess))       ;Res-Miss
        (intervalo (distancia 2) (tipo aumentada) (nota1 Db) (nota2 E))         ;Reb-Mi
        (intervalo (distancia 2) (tipo aumentada) (nota1 E) (nota2 Fss))        ;Mi-Fass
        (intervalo (distancia 2) (tipo aumentada) (nota1 Es) (nota2 Fsss))      ;Mis-Fasss
        (intervalo (distancia 2) (tipo aumentada) (nota1 Eb) (nota2 Fs))        ;Mib-Fas
        (intervalo (distancia 2) (tipo aumentada) (nota1 F) (nota2 Gs))         ;Fa-Sols
        (intervalo (distancia 2) (tipo aumentada) (nota1 Fs) (nota2 Gss))       ;Fas-Solss
        (intervalo (distancia 2) (tipo aumentada) (nota1 Fb) (nota2 G))         ;Fab-Sol
        (intervalo (distancia 2) (tipo aumentada) (nota1 G) (nota2 As))         ;Sol-Las
        (intervalo (distancia 2) (tipo aumentada) (nota1 Gs) (nota2 Ass))       ;Sols-Lass
        (intervalo (distancia 2) (tipo aumentada) (nota1 Gb) (nota2 A))         ;Solb-La
        (intervalo (distancia 2) (tipo aumentada) (nota1 A) (nota2 Bs))         ;La-Sis
        (intervalo (distancia 2) (tipo aumentada) (nota1 As) (nota2 Bss))       ;Las-Siss
        (intervalo (distancia 2) (tipo aumentada) (nota1 Ab) (nota2 B))         ;Lab-Si
        (intervalo (distancia 2) (tipo aumentada) (nota1 B) (nota2 Css))        ;Si-Doss
        (intervalo (distancia 2) (tipo aumentada) (nota1 Bs) (nota2 Csss))      ;Sis-Dosss
        (intervalo (distancia 2) (tipo aumentada) (nota1 Bb) (nota2 Cs))        ;Sib-Dos

        (intervalo (distancia 3) (tipo menor) (nota1 C) (nota2 Eb))     ;Do-Mib   
        (intervalo (distancia 3) (tipo menor) (nota1 Cs) (nota2 E))     ;Dos-Mi
        (intervalo (distancia 3) (tipo menor) (nota1 Cb) (nota2 Ebb))   ;Dob-Mibb
        (intervalo (distancia 3) (tipo menor) (nota1 D) (nota2 F))      ;Re-Fa
        (intervalo (distancia 3) (tipo menor) (nota1 Ds) (nota2 Fs))    ;Res-Fas
        (intervalo (distancia 3) (tipo menor) (nota1 Db) (nota2 Fb))    ;Reb-Fab
        (intervalo (distancia 3) (tipo menor) (nota1 E) (nota2 G))      ;Mi-Sol
        (intervalo (distancia 3) (tipo menor) (nota1 Es) (nota2 Gs))    ;Mis-Sols
        (intervalo (distancia 3) (tipo menor) (nota1 Eb) (nota2 Gb))    ;Mib-Solb
        (intervalo (distancia 3) (tipo menor) (nota1 F) (nota2 Ab))     ;Fa-Lab
        (intervalo (distancia 3) (tipo menor) (nota1 Fs) (nota2 A))     ;Fas-La
        (intervalo (distancia 3) (tipo menor) (nota1 Fb) (nota2 Abb))   ;Fab-Labb
        (intervalo (distancia 3) (tipo menor) (nota1 G) (nota2 Bb))     ;Sol-Sib
        (intervalo (distancia 3) (tipo menor) (nota1 Gs) (nota2 B))     ;Sols-Si
        (intervalo (distancia 3) (tipo menor) (nota1 Gb) (nota2 Bbb))   ;Solb-Sibb
        (intervalo (distancia 3) (tipo menor) (nota1 A) (nota2 C))      ;La-Do
        (intervalo (distancia 3) (tipo menor) (nota1 As) (nota2 Cs))    ;Las-Dos
        (intervalo (distancia 3) (tipo menor) (nota1 Ab) (nota2 Cb))    ;Lab-Dob
        (intervalo (distancia 3) (tipo menor) (nota1 B) (nota2 D))      ;Si-Re
        (intervalo (distancia 3) (tipo menor) (nota1 Bs) (nota2 Ds))    ;Sis-Res
        (intervalo (distancia 3) (tipo menor) (nota1 Bb) (nota2 Db))    ;Sib-Reb

        (intervalo (distancia 3) (tipo mayor) (nota1 C) (nota2 E))      ;Do-Mi   
        (intervalo (distancia 3) (tipo mayor) (nota1 Cs) (nota2 Es))    ;Dos-Mis
        (intervalo (distancia 3) (tipo mayor) (nota1 Cb) (nota2 Eb))    ;Dob-Mib
        (intervalo (distancia 3) (tipo mayor) (nota1 D) (nota2 Fs))     ;Re-Fas
        (intervalo (distancia 3) (tipo mayor) (nota1 Ds) (nota2 Fss))   ;Res-Fass
        (intervalo (distancia 3) (tipo mayor) (nota1 Db) (nota2 F))     ;Reb-Fa
        (intervalo (distancia 3) (tipo mayor) (nota1 E) (nota2 Gs))     ;Mi-Sols
        (intervalo (distancia 3) (tipo mayor) (nota1 Es) (nota2 Gss))   ;Mis-Solss
        (intervalo (distancia 3) (tipo mayor) (nota1 Eb) (nota2 G))     ;Mib-Sol
        (intervalo (distancia 3) (tipo mayor) (nota1 F) (nota2 A))      ;Fa-La
        (intervalo (distancia 3) (tipo mayor) (nota1 Fs) (nota2 As))    ;Fas-Las
        (intervalo (distancia 3) (tipo mayor) (nota1 Fb) (nota2 Ab))    ;Fab-Lab
        (intervalo (distancia 3) (tipo mayor) (nota1 G) (nota2 B))      ;Sol-Si
        (intervalo (distancia 3) (tipo mayor) (nota1 Gs) (nota2 Bs))    ;Sols-Sis
        (intervalo (distancia 3) (tipo mayor) (nota1 Gb) (nota2 Bb))    ;Solb-Sib
        (intervalo (distancia 3) (tipo mayor) (nota1 A) (nota2 Cs))     ;La-Dos
        (intervalo (distancia 3) (tipo mayor) (nota1 As) (nota2 Css))   ;Las-Doss
        (intervalo (distancia 3) (tipo mayor) (nota1 Ab) (nota2 C))     ;Lab-Do
        (intervalo (distancia 3) (tipo mayor) (nota1 B) (nota2 Ds))     ;Si-Res
        (intervalo (distancia 3) (tipo mayor) (nota1 Bs) (nota2 Dss))   ;Sis-Ress
        (intervalo (distancia 3) (tipo mayor) (nota1 Bb) (nota2 D))     ;Sib-Re

        (intervalo (distancia 3) (tipo aumentada) (nota1 C) (nota2 Es))         ;Do-Mis   
        (intervalo (distancia 3) (tipo aumentada) (nota1 Cs) (nota2 Ess))       ;Dos-Miss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Cb) (nota2 E))         ;Dob-Mi
        (intervalo (distancia 3) (tipo aumentada) (nota1 D) (nota2 Fss))        ;Re-Fass
        (intervalo (distancia 3) (tipo aumentada) (nota1 Ds) (nota2 Fsss))      ;Res-Fasss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Db) (nota2 Fs))        ;Reb-Fas
        (intervalo (distancia 3) (tipo aumentada) (nota1 E) (nota2 Gss))        ;Mi-Solss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Es) (nota2 Gsss))      ;Mis-Solsss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Eb) (nota2 Gs))        ;Mib-Sols
        (intervalo (distancia 3) (tipo aumentada) (nota1 F) (nota2 As))         ;Fa-Las
        (intervalo (distancia 3) (tipo aumentada) (nota1 Fs) (nota2 Ass))       ;Fas-Lass
        (intervalo (distancia 3) (tipo aumentada) (nota1 Fb) (nota2 A))         ;Fab-La
        (intervalo (distancia 3) (tipo aumentada) (nota1 G) (nota2 Bs))         ;Sol-Sis
        (intervalo (distancia 3) (tipo aumentada) (nota1 Gs) (nota2 Bss))       ;Sols-Siss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Gb) (nota2 B))         ;Solb-Si
        (intervalo (distancia 3) (tipo aumentada) (nota1 A) (nota2 Css))        ;La-Doss
        (intervalo (distancia 3) (tipo aumentada) (nota1 As) (nota2 Csss))      ;Las-Dosss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Ab) (nota2 Cs))        ;Lab-Dos
        (intervalo (distancia 3) (tipo aumentada) (nota1 B) (nota2 Dss))        ;Si-Ress
        (intervalo (distancia 3) (tipo aumentada) (nota1 Bs) (nota2 Dsss))      ;Sis-Resss
        (intervalo (distancia 3) (tipo aumentada) (nota1 Bb) (nota2 Ds))        ;Sib-Res

        (intervalo (distancia 4) (tipo justa) (nota1 C) (nota2 F))      ;Do-Fa   
        (intervalo (distancia 4) (tipo justa) (nota1 Cs) (nota2 Fs))    ;Dos-Fas
        (intervalo (distancia 4) (tipo justa) (nota1 Cb) (nota2 Fb))    ;Dob-Fab
        (intervalo (distancia 4) (tipo justa) (nota1 D) (nota2 G))      ;Re-Sol
        (intervalo (distancia 4) (tipo justa) (nota1 Ds) (nota2 Gs))    ;Res-Sols
        (intervalo (distancia 4) (tipo justa) (nota1 Db) (nota2 Gb))    ;Reb-Solb
        (intervalo (distancia 4) (tipo justa) (nota1 E) (nota2 A))      ;Mi-La
        (intervalo (distancia 4) (tipo justa) (nota1 Es) (nota2 As))    ;Mis-Las
        (intervalo (distancia 4) (tipo justa) (nota1 Eb) (nota2 Ab))    ;Mib-Lab
        (intervalo (distancia 4) (tipo justa) (nota1 F) (nota2 Bb))     ;Fa-Sib
        (intervalo (distancia 4) (tipo justa) (nota1 Fs) (nota2 B))     ;Fas-Si
        (intervalo (distancia 4) (tipo justa) (nota1 Fb) (nota2 Bbb))   ;Fab-Sibb
        (intervalo (distancia 4) (tipo justa) (nota1 G) (nota2 C))      ;Sol-Do
        (intervalo (distancia 4) (tipo justa) (nota1 Gs) (nota2 Cs))    ;Sols-Dos
        (intervalo (distancia 4) (tipo justa) (nota1 Gb) (nota2 Cb))    ;Solb-Dob
        (intervalo (distancia 4) (tipo justa) (nota1 A) (nota2 D))      ;La-Re
        (intervalo (distancia 4) (tipo justa) (nota1 As) (nota2 Ds))    ;Las-Res
        (intervalo (distancia 4) (tipo justa) (nota1 Ab) (nota2 Db))    ;Lab-Reb
        (intervalo (distancia 4) (tipo justa) (nota1 B) (nota2 E))      ;Si-Mi
        (intervalo (distancia 4) (tipo justa) (nota1 Bs) (nota2 Es))    ;Sis-Mis
        (intervalo (distancia 4) (tipo justa) (nota1 Bb) (nota2 Eb))    ;Sib-Mib

        (intervalo (distancia 4) (tipo disminuida) (nota1 C) (nota2 Fb))        ;Do-Fab   
        (intervalo (distancia 4) (tipo disminuida) (nota1 Cs) (nota2 F))        ;Dos-Fa
        (intervalo (distancia 4) (tipo disminuida) (nota1 Cb) (nota2 Fbb))      ;Dob-Fabb
        (intervalo (distancia 4) (tipo disminuida) (nota1 D) (nota2 Gb))        ;Re-Solb
        (intervalo (distancia 4) (tipo disminuida) (nota1 Ds) (nota2 G))        ;Res-Sol
        (intervalo (distancia 4) (tipo disminuida) (nota1 Db) (nota2 Gbb))      ;Reb-Solbb
        (intervalo (distancia 4) (tipo disminuida) (nota1 E) (nota2 Ab))        ;Mi-Lab
        (intervalo (distancia 4) (tipo disminuida) (nota1 Es) (nota2 A))        ;Mis-La
        (intervalo (distancia 4) (tipo disminuida) (nota1 Eb) (nota2 Abb))      ;Mib-Labb
        (intervalo (distancia 4) (tipo disminuida) (nota1 F) (nota2 Bbb))       ;Fa-Sibb
        (intervalo (distancia 4) (tipo disminuida) (nota1 Fs) (nota2 Bb))       ;Fas-Sib
        (intervalo (distancia 4) (tipo disminuida) (nota1 Fb) (nota2 Bbbb))     ;Fab-Sibbb
        (intervalo (distancia 4) (tipo disminuida) (nota1 G) (nota2 Cb))        ;Sol-Dob
        (intervalo (distancia 4) (tipo disminuida) (nota1 Gs) (nota2 C))        ;Sols-Do
        (intervalo (distancia 4) (tipo disminuida) (nota1 Gb) (nota2 Cbb))      ;Solb-Dobb
        (intervalo (distancia 4) (tipo disminuida) (nota1 A) (nota2 Db))        ;La-Reb
        (intervalo (distancia 4) (tipo disminuida) (nota1 As) (nota2 D))        ;Las-Re
        (intervalo (distancia 4) (tipo disminuida) (nota1 Ab) (nota2 Dbb))      ;Lab-Rebb
        (intervalo (distancia 4) (tipo disminuida) (nota1 B) (nota2 Eb))        ;Si-Mib
        (intervalo (distancia 4) (tipo disminuida) (nota1 Bs) (nota2 E))        ;Sis-Mi
        (intervalo (distancia 4) (tipo disminuida) (nota1 Bb) (nota2 Ebb))      ;Sib-Mibb

        (intervalo (distancia 4) (tipo aumentada) (nota1 C) (nota2 Fs))         ;Do-Fas   
        (intervalo (distancia 4) (tipo aumentada) (nota1 Cs) (nota2 Fss))       ;Dos-Fass
        (intervalo (distancia 4) (tipo aumentada) (nota1 Cb) (nota2 F))         ;Dob-Fa
        (intervalo (distancia 4) (tipo aumentada) (nota1 D) (nota2 Gs))         ;Re-Sols
        (intervalo (distancia 4) (tipo aumentada) (nota1 Ds) (nota2 Gss))       ;Res-Solss
        (intervalo (distancia 4) (tipo aumentada) (nota1 Db) (nota2 G))         ;Reb-Sol
        (intervalo (distancia 4) (tipo aumentada) (nota1 E) (nota2 As))         ;Mi-Las
        (intervalo (distancia 4) (tipo aumentada) (nota1 Es) (nota2 Ass))       ;Mis-Lass
        (intervalo (distancia 4) (tipo aumentada) (nota1 Eb) (nota2 A))         ;Mib-La
        (intervalo (distancia 4) (tipo aumentada) (nota1 F) (nota2 B))          ;Fa-Si
        (intervalo (distancia 4) (tipo aumentada) (nota1 Fs) (nota2 Bs))        ;Fas-Sis
        (intervalo (distancia 4) (tipo aumentada) (nota1 Fb) (nota2 Bb))        ;Fab-Sib
        (intervalo (distancia 4) (tipo aumentada) (nota1 G) (nota2 Cs))         ;Sol-Dos
        (intervalo (distancia 4) (tipo aumentada) (nota1 Gs) (nota2 Css))       ;Sols-Doss
        (intervalo (distancia 4) (tipo aumentada) (nota1 Gb) (nota2 C))         ;Solb-Do
        (intervalo (distancia 4) (tipo aumentada) (nota1 A) (nota2 Ds))         ;La-Res
        (intervalo (distancia 4) (tipo aumentada) (nota1 As) (nota2 Dss))       ;Las-Ress
        (intervalo (distancia 4) (tipo aumentada) (nota1 Ab) (nota2 D))         ;Lab-Re
        (intervalo (distancia 4) (tipo aumentada) (nota1 B) (nota2 Es))         ;Si-Mis
        (intervalo (distancia 4) (tipo aumentada) (nota1 Bs) (nota2 Ess))       ;Sis-Miss
        (intervalo (distancia 4) (tipo aumentada) (nota1 Bb) (nota2 E))         ;Sib-Mi

        (intervalo (distancia 5) (tipo justa) (nota1 C) (nota2 G))      ;Do-Sol   
        (intervalo (distancia 5) (tipo justa) (nota1 Cs) (nota2 Gs))    ;Dos-Sols
        (intervalo (distancia 5) (tipo justa) (nota1 Cb) (nota2 Gb))    ;Dob-Solb
        (intervalo (distancia 5) (tipo justa) (nota1 D) (nota2 A))      ;Re-La
        (intervalo (distancia 5) (tipo justa) (nota1 Ds) (nota2 As))    ;Res-Las
        (intervalo (distancia 5) (tipo justa) (nota1 Db) (nota2 Ab))    ;Reb-Lab
        (intervalo (distancia 5) (tipo justa) (nota1 E) (nota2 B))      ;Mi-Si
        (intervalo (distancia 5) (tipo justa) (nota1 Es) (nota2 Bs))    ;Mis-Sis
        (intervalo (distancia 5) (tipo justa) (nota1 Eb) (nota2 Bb))    ;Mib-Sib
        (intervalo (distancia 5) (tipo justa) (nota1 F) (nota2 C))      ;Fa-Do
        (intervalo (distancia 5) (tipo justa) (nota1 Fs) (nota2 Cs))    ;Fas-Dos
        (intervalo (distancia 5) (tipo justa) (nota1 Fb) (nota2 Cb))    ;Fab-Dob
        (intervalo (distancia 5) (tipo justa) (nota1 G) (nota2 D))      ;Sol-Re
        (intervalo (distancia 5) (tipo justa) (nota1 Gs) (nota2 Ds))    ;Sols-Res
        (intervalo (distancia 5) (tipo justa) (nota1 Gb) (nota2 Db))    ;Solb-Reb
        (intervalo (distancia 5) (tipo justa) (nota1 A) (nota2 E))      ;La-Mi
        (intervalo (distancia 5) (tipo justa) (nota1 As) (nota2 Es))    ;Las-Mis
        (intervalo (distancia 5) (tipo justa) (nota1 Ab) (nota2 Eb))    ;Lab-Mib
        (intervalo (distancia 5) (tipo justa) (nota1 B) (nota2 Fs))     ;Si-Fas
        (intervalo (distancia 5) (tipo justa) (nota1 Bs) (nota2 Fss))   ;Sis-Fass
        (intervalo (distancia 5) (tipo justa) (nota1 Bb) (nota2 F))     ;Sib-Fa

        (intervalo (distancia 5) (tipo disminuida) (nota1 C) (nota2 Gb))        ;Do-Solb   
        (intervalo (distancia 5) (tipo disminuida) (nota1 Cs) (nota2 G))        ;Dos-Sol
        (intervalo (distancia 5) (tipo disminuida) (nota1 Cb) (nota2 Gbb))      ;Dob-Solbb
        (intervalo (distancia 5) (tipo disminuida) (nota1 D) (nota2 Ab))        ;Re-Lab
        (intervalo (distancia 5) (tipo disminuida) (nota1 Ds) (nota2 A))        ;Res-La
        (intervalo (distancia 5) (tipo disminuida) (nota1 Db) (nota2 Abb))      ;Reb-Labb
        (intervalo (distancia 5) (tipo disminuida) (nota1 E) (nota2 Bb))        ;Mi-Sib
        (intervalo (distancia 5) (tipo disminuida) (nota1 Es) (nota2 B))        ;Mis-Si
        (intervalo (distancia 5) (tipo disminuida) (nota1 Eb) (nota2 Bbb))      ;Mib-Sibb
        (intervalo (distancia 5) (tipo disminuida) (nota1 F) (nota2 Cb))        ;Fa-Dob
        (intervalo (distancia 5) (tipo disminuida) (nota1 Fs) (nota2 C))        ;Fas-Do
        (intervalo (distancia 5) (tipo disminuida) (nota1 Fb) (nota2 Cbb))      ;Fab-Dobb
        (intervalo (distancia 5) (tipo disminuida) (nota1 G) (nota2 Db))        ;Sol-Reb
        (intervalo (distancia 5) (tipo disminuida) (nota1 Gs) (nota2 D))        ;Sols-Re
        (intervalo (distancia 5) (tipo disminuida) (nota1 Gb) (nota2 Dbb))      ;Solb-Rebb
        (intervalo (distancia 5) (tipo disminuida) (nota1 A) (nota2 Eb))        ;La-Mib
        (intervalo (distancia 5) (tipo disminuida) (nota1 As) (nota2 E))        ;Las-Mi
        (intervalo (distancia 5) (tipo disminuida) (nota1 Ab) (nota2 Ebb))      ;Lab-Mibb
        (intervalo (distancia 5) (tipo disminuida) (nota1 B) (nota2 F))         ;Si-Fa
        (intervalo (distancia 5) (tipo disminuida) (nota1 Bs) (nota2 Fs))       ;Sis-Fas
        (intervalo (distancia 5) (tipo disminuida) (nota1 Bb) (nota2 Fb))       ;Sib-Fab

        (intervalo (distancia 5) (tipo aumentada) (nota1 C) (nota2 Gs))         ;Do-Sols   
        (intervalo (distancia 5) (tipo aumentada) (nota1 Cs) (nota2 Gss))       ;Dos-Solss
        (intervalo (distancia 5) (tipo aumentada) (nota1 Cb) (nota2 G))         ;Dob-Sol
        (intervalo (distancia 5) (tipo aumentada) (nota1 D) (nota2 As))         ;Re-Las
        (intervalo (distancia 5) (tipo aumentada) (nota1 Ds) (nota2 Ass))       ;Res-Lass
        (intervalo (distancia 5) (tipo aumentada) (nota1 Db) (nota2 A))         ;Reb-La
        (intervalo (distancia 5) (tipo aumentada) (nota1 E) (nota2 Bs))         ;Mi-Sis
        (intervalo (distancia 5) (tipo aumentada) (nota1 Es) (nota2 Bss))       ;Mis-Siss
        (intervalo (distancia 5) (tipo aumentada) (nota1 Eb) (nota2 B))         ;Mib-Si
        (intervalo (distancia 5) (tipo aumentada) (nota1 F) (nota2 Cs))         ;Fa-Dos
        (intervalo (distancia 5) (tipo aumentada) (nota1 Fs) (nota2 Css))       ;Fas-Doss
        (intervalo (distancia 5) (tipo aumentada) (nota1 Fb) (nota2 C))         ;Fab-Do
        (intervalo (distancia 5) (tipo aumentada) (nota1 G) (nota2 Ds))         ;Sol-Res
        (intervalo (distancia 5) (tipo aumentada) (nota1 Gs) (nota2 Dss))       ;Sols-Ress
        (intervalo (distancia 5) (tipo aumentada) (nota1 Gb) (nota2 D))         ;Solb-Re
        (intervalo (distancia 5) (tipo aumentada) (nota1 A) (nota2 Es))         ;La-Mis
        (intervalo (distancia 5) (tipo aumentada) (nota1 As) (nota2 Ess))       ;Las-Miss
        (intervalo (distancia 5) (tipo aumentada) (nota1 Ab) (nota2 E))         ;Lab-Mi
        (intervalo (distancia 5) (tipo aumentada) (nota1 B) (nota2 Fss))        ;Si-Fass
        (intervalo (distancia 5) (tipo aumentada) (nota1 Bs) (nota2 Fsss))      ;Sis-Fasss
        (intervalo (distancia 5) (tipo aumentada) (nota1 Bb) (nota2 Fs))        ;Sib-Fas

        (intervalo (distancia 6) (tipo menor) (nota1 C) (nota2 Ab))     ;Do-Lab   
        (intervalo (distancia 6) (tipo menor) (nota1 Cs) (nota2 A))     ;Dos-La
        (intervalo (distancia 6) (tipo menor) (nota1 Cb) (nota2 Abb))   ;Dob-Labb
        (intervalo (distancia 6) (tipo menor) (nota1 D) (nota2 Bb))     ;Re-Sib
        (intervalo (distancia 6) (tipo menor) (nota1 Ds) (nota2 B))     ;Res-Si
        (intervalo (distancia 6) (tipo menor) (nota1 Db) (nota2 Bbb))   ;Reb-Sibb
        (intervalo (distancia 6) (tipo menor) (nota1 E) (nota2 C))      ;Mi-Do
        (intervalo (distancia 6) (tipo menor) (nota1 Es) (nota2 Cs))    ;Mis-Dos
        (intervalo (distancia 6) (tipo menor) (nota1 Eb) (nota2 Cb))    ;Mib-Dob
        (intervalo (distancia 6) (tipo menor) (nota1 F) (nota2 Db))     ;Fa-Reb
        (intervalo (distancia 6) (tipo menor) (nota1 Fs) (nota2 D))     ;Fas-Re
        (intervalo (distancia 6) (tipo menor) (nota1 Fb) (nota2 Dbb))   ;Fab-Rebb
        (intervalo (distancia 6) (tipo menor) (nota1 G) (nota2 Eb))     ;Sol-Mib
        (intervalo (distancia 6) (tipo menor) (nota1 Gs) (nota2 E))     ;Sols-Mi
        (intervalo (distancia 6) (tipo menor) (nota1 Gb) (nota2 Ebb))   ;Solb-Mibb
        (intervalo (distancia 6) (tipo menor) (nota1 A) (nota2 F))      ;La-Fa
        (intervalo (distancia 6) (tipo menor) (nota1 As) (nota2 Fs))    ;Las-Fas
        (intervalo (distancia 6) (tipo menor) (nota1 Ab) (nota2 Fb))    ;Lab-Fab
        (intervalo (distancia 6) (tipo menor) (nota1 B) (nota2 G))      ;Si-Sol
        (intervalo (distancia 6) (tipo menor) (nota1 Bs) (nota2 Gs))    ;Sis-Sols
        (intervalo (distancia 6) (tipo menor) (nota1 Bb) (nota2 Gb))    ;Sib-Solb

        (intervalo (distancia 6) (tipo mayor) (nota1 C) (nota2 A))      ;Do-La   
        (intervalo (distancia 6) (tipo mayor) (nota1 Cs) (nota2 As))    ;Dos-Las
        (intervalo (distancia 6) (tipo mayor) (nota1 Cb) (nota2 Ab))    ;Dob-Lab
        (intervalo (distancia 6) (tipo mayor) (nota1 D) (nota2 B))      ;Re-Si
        (intervalo (distancia 6) (tipo mayor) (nota1 Ds) (nota2 Bs))    ;Res-Sis
        (intervalo (distancia 6) (tipo mayor) (nota1 Db) (nota2 Bb))    ;Reb-Sib
        (intervalo (distancia 6) (tipo mayor) (nota1 E) (nota2 Cs))     ;Mi-Dos
        (intervalo (distancia 6) (tipo mayor) (nota1 Es) (nota2 Css))   ;Mis-Doss
        (intervalo (distancia 6) (tipo mayor) (nota1 Eb) (nota2 C))     ;Mib-Do
        (intervalo (distancia 6) (tipo mayor) (nota1 F) (nota2 D))      ;Fa-Re
        (intervalo (distancia 6) (tipo mayor) (nota1 Fs) (nota2 Ds))    ;Fas-Res
        (intervalo (distancia 6) (tipo mayor) (nota1 Fb) (nota2 Db))    ;Fab-Reb
        (intervalo (distancia 6) (tipo mayor) (nota1 G) (nota2 E))      ;Sol-Mi
        (intervalo (distancia 6) (tipo mayor) (nota1 Gs) (nota2 Es))    ;Sols-Mis
        (intervalo (distancia 6) (tipo mayor) (nota1 Gb) (nota2 Eb))    ;Solb-Mib
        (intervalo (distancia 6) (tipo mayor) (nota1 A) (nota2 Fs))     ;La-Fas
        (intervalo (distancia 6) (tipo mayor) (nota1 As) (nota2 Fss))   ;Las-Fass
        (intervalo (distancia 6) (tipo mayor) (nota1 Ab) (nota2 F))     ;Lab-Fa
        (intervalo (distancia 6) (tipo mayor) (nota1 B) (nota2 Gs))     ;Si-Sols
        (intervalo (distancia 6) (tipo mayor) (nota1 Bs) (nota2 Gss))   ;Sis-Solss
        (intervalo (distancia 6) (tipo mayor) (nota1 Bb) (nota2 G))     ;Sib-Sol

        (intervalo (distancia 6) (tipo aumentada) (nota1 C) (nota2 As))         ;Do-Las   
        (intervalo (distancia 6) (tipo aumentada) (nota1 Cs) (nota2 Ass))       ;Dos-Lass
        (intervalo (distancia 6) (tipo aumentada) (nota1 Cb) (nota2 A))         ;Dob-La
        (intervalo (distancia 6) (tipo aumentada) (nota1 D) (nota2 Bs))         ;Re-Sis
        (intervalo (distancia 6) (tipo aumentada) (nota1 Ds) (nota2 Bss))       ;Res-Siss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Db) (nota2 B))         ;Reb-Si
        (intervalo (distancia 6) (tipo aumentada) (nota1 E) (nota2 Css))        ;Mi-Doss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Es) (nota2 Csss))      ;Mis-Dosss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Eb) (nota2 Cs))        ;Mib-Dos
        (intervalo (distancia 6) (tipo aumentada) (nota1 F) (nota2 Ds))         ;Fa-Res
        (intervalo (distancia 6) (tipo aumentada) (nota1 Fs) (nota2 Dss))       ;Fas-Ress
        (intervalo (distancia 6) (tipo aumentada) (nota1 Fb) (nota2 D))         ;Fab-Re
        (intervalo (distancia 6) (tipo aumentada) (nota1 G) (nota2 Es))         ;Sol-Mis
        (intervalo (distancia 6) (tipo aumentada) (nota1 Gs) (nota2 Ess))       ;Sols-Miss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Gb) (nota2 E))         ;Solb-Mi
        (intervalo (distancia 6) (tipo aumentada) (nota1 A) (nota2 Fss))        ;La-Fass
        (intervalo (distancia 6) (tipo aumentada) (nota1 As) (nota2 Fsss))      ;Las-Fasss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Ab) (nota2 Fs))        ;Lab-Fas
        (intervalo (distancia 6) (tipo aumentada) (nota1 B) (nota2 Gss))        ;Si-Solss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Bs) (nota2 Gsss))      ;Sis-Solsss
        (intervalo (distancia 6) (tipo aumentada) (nota1 Bb) (nota2 Gs))        ;Sib-Sols

        (intervalo (distancia 7) (tipo menor) (nota1 C) (nota2 Bb))     ;Do-Sib   
        (intervalo (distancia 7) (tipo menor) (nota1 Cs) (nota2 B))     ;Dos-Si
        (intervalo (distancia 7) (tipo menor) (nota1 Cb) (nota2 Bbb))   ;Dob-Sibb
        (intervalo (distancia 7) (tipo menor) (nota1 D) (nota2 C))      ;Re-Do
        (intervalo (distancia 7) (tipo menor) (nota1 Ds) (nota2 Cs))    ;Res-Dos
        (intervalo (distancia 7) (tipo menor) (nota1 Db) (nota2 Cb))    ;Reb-Dob
        (intervalo (distancia 7) (tipo menor) (nota1 E) (nota2 D))      ;Mi-Re
        (intervalo (distancia 7) (tipo menor) (nota1 Es) (nota2 Ds))    ;Mis-Res
        (intervalo (distancia 7) (tipo menor) (nota1 Eb) (nota2 Db))    ;Mib-Reb
        (intervalo (distancia 7) (tipo menor) (nota1 F) (nota2 Eb))     ;Fa-Mib
        (intervalo (distancia 7) (tipo menor) (nota1 Fs) (nota2 E))     ;Fas-Mi
        (intervalo (distancia 7) (tipo menor) (nota1 Fb) (nota2 Ebb))   ;Fab-Mibb
        (intervalo (distancia 7) (tipo menor) (nota1 G) (nota2 F))      ;Sol-Fa
        (intervalo (distancia 7) (tipo menor) (nota1 Gs) (nota2 Fs))    ;Sols-Fas
        (intervalo (distancia 7) (tipo menor) (nota1 Gb) (nota2 Fb))    ;Solb-Fab
        (intervalo (distancia 7) (tipo menor) (nota1 A) (nota2 G))      ;La-Sol
        (intervalo (distancia 7) (tipo menor) (nota1 As) (nota2 Gs))    ;Las-Sols
        (intervalo (distancia 7) (tipo menor) (nota1 Ab) (nota2 Gb))    ;Lab-Solb
        (intervalo (distancia 7) (tipo menor) (nota1 B) (nota2 A))      ;Si-La
        (intervalo (distancia 7) (tipo menor) (nota1 Bs) (nota2 As))    ;Sis-Las
        (intervalo (distancia 7) (tipo menor) (nota1 Bb) (nota2 Ab))    ;Sib-Lab

        (intervalo (distancia 7) (tipo mayor) (nota1 C) (nota2 B))      ;Do-Si   
        (intervalo (distancia 7) (tipo mayor) (nota1 Cs) (nota2 Bs))    ;Dos-Sis
        (intervalo (distancia 7) (tipo mayor) (nota1 Cb) (nota2 Bb))    ;Dob-Sib
        (intervalo (distancia 7) (tipo mayor) (nota1 D) (nota2 Cs))     ;Re-Dos
        (intervalo (distancia 7) (tipo mayor) (nota1 Ds) (nota2 Css))   ;Res-Doss
        (intervalo (distancia 7) (tipo mayor) (nota1 Db) (nota2 C))     ;Reb-Do
        (intervalo (distancia 7) (tipo mayor) (nota1 E) (nota2 Ds))     ;Mi-Res
        (intervalo (distancia 7) (tipo mayor) (nota1 Es) (nota2 Dss))   ;Mis-Ress
        (intervalo (distancia 7) (tipo mayor) (nota1 Eb) (nota2 D))     ;Mib-Re
        (intervalo (distancia 7) (tipo mayor) (nota1 F) (nota2 E))      ;Fa-Mi
        (intervalo (distancia 7) (tipo mayor) (nota1 Fs) (nota2 Es))    ;Fas-Mis 
        (intervalo (distancia 7) (tipo mayor) (nota1 Fb) (nota2 Eb))    ;Fab-Mib
        (intervalo (distancia 7) (tipo mayor) (nota1 G) (nota2 Fs))     ;Sol-Fas
        (intervalo (distancia 7) (tipo mayor) (nota1 Gs) (nota2 Fss))   ;Sols-Fass
        (intervalo (distancia 7) (tipo mayor) (nota1 Gb) (nota2 F))     ;Solb-Fa
        (intervalo (distancia 7) (tipo mayor) (nota1 A) (nota2 Gs))     ;La-Sols
        (intervalo (distancia 7) (tipo mayor) (nota1 As) (nota2 Gss))   ;Las-Solss
        (intervalo (distancia 7) (tipo mayor) (nota1 Ab) (nota2 G))     ;Lab-Sol
        (intervalo (distancia 7) (tipo mayor) (nota1 B) (nota2 As))     ;Si-Las
        (intervalo (distancia 7) (tipo mayor) (nota1 Bs) (nota2 Ass))   ;Sis-Lass
        (intervalo (distancia 7) (tipo mayor) (nota1 Bb) (nota2 A))     ;Sib-La

        (intervalo (distancia 8) (tipo justa) (nota1 C) (nota2 C))      ;Do-Do   
        (intervalo (distancia 8) (tipo justa) (nota1 Cs) (nota2 Cs))    ;Dos-Dos
        (intervalo (distancia 8) (tipo justa) (nota1 Cb) (nota2 Cb))    ;Dob-Dob
        (intervalo (distancia 8) (tipo justa) (nota1 D) (nota2 D))      ;Re-Re
        (intervalo (distancia 8) (tipo justa) (nota1 Ds) (nota2 Ds))    ;Res-Res
        (intervalo (distancia 8) (tipo justa) (nota1 Db) (nota2 Db))    ;Reb-Reb
        (intervalo (distancia 8) (tipo justa) (nota1 E) (nota2 E))      ;Mi-Mi
        (intervalo (distancia 8) (tipo justa) (nota1 Es) (nota2 Es))    ;Mis-Mis
        (intervalo (distancia 8) (tipo justa) (nota1 Eb) (nota2 Eb))    ;Mib-Mib
        (intervalo (distancia 8) (tipo justa) (nota1 F) (nota2 F))      ;Fa-Fa
        (intervalo (distancia 8) (tipo justa) (nota1 Fs) (nota2 Fs))    ;Fas-Fas
        (intervalo (distancia 8) (tipo justa) (nota1 Fb) (nota2 Fb))    ;Fab-Fab
        (intervalo (distancia 8) (tipo justa) (nota1 G) (nota2 G))      ;Sol-Sol
        (intervalo (distancia 8) (tipo justa) (nota1 Gs) (nota2 Gs))    ;Sols-Sols
        (intervalo (distancia 8) (tipo justa) (nota1 Gb) (nota2 Gb))    ;Solb-Solb
        (intervalo (distancia 8) (tipo justa) (nota1 A) (nota2 A))      ;La-La
        (intervalo (distancia 8) (tipo justa) (nota1 As) (nota2 As))    ;Las-Las
        (intervalo (distancia 8) (tipo justa) (nota1 Ab) (nota2 Ab))    ;Lab-Lab
        (intervalo (distancia 8) (tipo justa) (nota1 B) (nota2 B))      ;Si-Si
        (intervalo (distancia 8) (tipo justa) (nota1 Bs) (nota2 Bs))    ;Sis-Sis
        (intervalo (distancia 8) (tipo justa) (nota1 Bb) (nota2 Bb))    ;Sib-Sib
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                     HECHOS CALCULADOS                     ;;;
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
        (open "tonalidad" mydata_tonalidad)
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
        (open "soprano_acordes" mydata_soprano)
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
        (open "contraalto_acordes" mydata_contraalto)
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
        (open "tenor_acordes" mydata_tenor)
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
        (open "bajo_acordes" mydata_bajo)
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
        (open "soprano_movimientos_a" mydata_mov_soprano)
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
        (open "contraalto_movimientos_a" mydata_mov_contraalto)
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
        (open "tenor_movimientos_a" mydata_mov_tenor)
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
        (open "bajo_movimientos_a" mydata_mov_bajo)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                      MOSTRAR FALLOS                       ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reglas para mostrar los tipos de fallos
(defrule mostrar_quintas

        (declare (salience -10000))
        (fallo (tipo quintas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "fallos_mod1" data "w")
        (printout data "Hay quintas paralelas en las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ".")
        (close data)
)

(defrule mostrar_octavas

        (declare (salience -10000))
        (fallo (tipo octavas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "fallos_mod1" data "w")
        (printout data "Hay octavas paralelas en las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ".")
        (close data)
)

(defrule mostrar_quintas_directas

        (declare (salience -10000))
        (fallo (tipo quintas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "fallos_mod1" data "w")
        (printout data "Hay quintas directas en voces extremas en la " ?parte " parte del compas " ?compas ".")
        (close data)
)

(defrule mostrar_octavas_directas

        (declare (salience -10000))
        (fallo (tipo octavas_directas) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "fallos_mod1" data "w")
        (printout data "Hay octavas directas en voces extremas en la " ?parte " parte del compas " ?compas ".")
        (close data)
)

(defrule mostrar_tritono

        (declare (salience -10000))
        (fallo (tipo tritono) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "fallos_mod1" data "w")
        (printout data "Hay un tritono entre las voces " ?v1 " y " ?v2 " en la " ?parte " parte del compas " ?compas ".")
        (close data)
)

(defrule mostrar_duplicacion_sensibles

        (declare (salience -10000))
        (fallo (tipo duplicacion_sensible) (voz1 ?v1) (voz2 ?v2) (tiempo ?i))
        =>
        (bind ?compas (/ ?i 16))
        (bind ?parte (/ (mod ?i 16) 4))
        (open "fallos_mod1" data "w")
        (printout data "Las voces " ?v1 " y " ?v2 " duplican la sensible de la tonalidad en la " ?parte " del compas " ?compas ".")
        (close data)
)