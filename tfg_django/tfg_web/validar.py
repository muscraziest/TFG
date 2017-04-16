def validarExtension(f):
	import os
	from django.core.exceptions import ValidationError

	ext = os.path.splitext(f.name)[1]
	extension_valida = ['.xml']

	if not ext.lower() in extension_valida:
		raise ValidationError(u'Error: la extension debe ser xml')