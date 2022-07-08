extends TextureButton

var C = preload("res://MecanismoMoleculas/sprites-elements/C.png")
var H = preload("res://MecanismoMoleculas/sprites-elements/H.png")
var O = preload("res://MecanismoMoleculas/sprites-elements/O.png")
var N = preload("res://MecanismoMoleculas/sprites-elements/N.png")
var Cl = preload("res://MecanismoMoleculas/sprites-elements/Cl.png")
var Br = preload("res://MecanismoMoleculas/sprites-elements/Br.png")
var LigSimples = preload("res://MecanismoMoleculas/sprites-elements/lig-simples.png")
var LigDupla = preload("res://MecanismoMoleculas/sprites-elements/lig-dupla.png")
var LigTripla = preload("res://MecanismoMoleculas/sprites-elements/lig-tripla.png")
var default = preload("res://MecanismoMoleculas/sprites-elements/frameClear.png")
var erro = preload("res://MecanismoMoleculas/sprites-elements/frame-erro.png")
onready var AudioFx = get_node("/root/AudioFx")

onready var control = $".".get_parent().get_parent().get_parent()

func _on_0_mouse_entered():
	self.get_child(0).visible = true
	
func _on_0_mouse_exited():
	if self.get_child(0).animation == "default":
		self.get_child(0).visible = false
	else: self.get_child(0).visible = true


func _on_0_pressed():
	var texture = get_node("/root/GlobalVar").element
	var linha = self.get_parent().name
	var coluna = self.name
	var verif = control.verifica(texture, linha, coluna)
	
	if verif:
		match texture:
			"C":
				$Sprite.texture = C
			"H":
				$Sprite.texture = H
			"O":
				$Sprite.texture = O
			"N":
				$Sprite.texture = N
			"Cl":
				$Sprite.texture = Cl
			"Br":
				$Sprite.texture = Br
			"LigSimples":
				$Sprite.texture = LigSimples
			"LigDupla":
				$Sprite.texture = LigDupla
			"LigTripla":
				$Sprite.texture = LigTripla
			default:
				$Sprite.texture = default
	else: 
		$Sprite.texture = erro
		AudioFx.play_error()
		
	
