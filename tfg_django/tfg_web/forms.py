from django import forms

OPCIONES=(

	('opcion1','Modulo 1: quintas, octavas, tritonos y duplicacion de sensibles'),
	('opcion2','Modulo 2: fallos melodicos y de contrapunto'),
	('opcion3','Modulo 3: analisis armonico'),
)

class Formulario(forms.Form):
	opciones = forms.MultipleChoiceField(required=False,widget=forms.CheckboxSelectMultiple,choices=OPCIONES)
	partitura = forms.FileField()