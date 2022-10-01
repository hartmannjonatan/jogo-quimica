extends CanvasLayer

onready var inventary = $"/root/Inventary"

func _ready():
	pass;

func _process(delta):
	var texto = textGrupos()
	$Label.text = texto

func textGrupos():
	var texto = ""
	for group in inventary.grupos:
		texto = texto + "\n -" + group
	
	return texto
