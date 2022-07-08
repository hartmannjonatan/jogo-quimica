extends Control

var elementGlobal = "default"
onready var inventary = $"/root/Inventary"

func _ready():
	if inventary.C == false:
		$GridContainer/C/C.disabled = true
		$GridContainer/C/C.visible = false
	if inventary.H == false:
		$GridContainer/H/H.disabled = true
		$GridContainer/H/H.visible = false
	if inventary.O == false:
		$GridContainer/O/O.disabled = true
		$GridContainer/O/O.visible = false
	if inventary.N == false:
		$GridContainer/N/N.disabled = true
		$GridContainer/N/N.visible = false
	if inventary.Cl == false:
		$GridContainer/Cl/Cl.disabled = true
		$GridContainer/Cl/Cl.visible = false
	if inventary.Br == false:
		$GridContainer/Br/Br.disabled = true
		$GridContainer/Br/Br.visible = false

func _process(delta):
	get_node("/root/GlobalVar").element = elementGlobal

func _on_C_pressed():
	elementGlobal = "C"


func _on_H_pressed():
	elementGlobal = "H"


func _on_O_pressed():
	elementGlobal = "O"


func _on_N_pressed():
	elementGlobal = "N"

func _on_Cl_pressed():
	elementGlobal = "Cl"


func _on_Br_pressed():
	elementGlobal = "Br"


func _on_LigSimp_pressed():
	elementGlobal = "LigSimples"


func _on_LigDupl_pressed():
	elementGlobal = "LigDupla"


func _on_LigTrip_pressed():
	elementGlobal = "LigTripla"
