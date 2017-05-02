# -*- coding: utf-8 -*-
from django import forms
from .validar import validarExtension

OPCIONES=(

	('opcion1','Módulo 1: quintas, octavas, tritonos y duplicación de sensibles'),
	('opcion2','Módulo 2: fallos melódicos y de contrapunto'),
	('opcion3','Módulo 3: análisis armónico, búsqueda de acordes incompletos'),
)

class Formulario(forms.Form):
	opciones = forms.MultipleChoiceField(required=False,widget=forms.CheckboxSelectMultiple,label='Selecciona de las siguientes opciones lo que quieres analizar',
		choices=OPCIONES)
	partitura = forms.FileField(label='Selecciona la partitura')