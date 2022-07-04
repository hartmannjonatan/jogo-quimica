extends CanvasLayer

var C_scene
var H_scene
var O_scene
var N_scene
var I_scene
var F_scene
var Cl_scene
var Br_scene
onready var inventary = $"/root/Inventary"

func _ready():
	C_scene = get_tree().get_nodes_in_group("C").size()
	H_scene = get_tree().get_nodes_in_group("H").size()
	O_scene = get_tree().get_nodes_in_group("O").size()
	N_scene = get_tree().get_nodes_in_group("N").size()
	I_scene = get_tree().get_nodes_in_group("I").size()
	F_scene = get_tree().get_nodes_in_group("F").size()
	Cl_scene = get_tree().get_nodes_in_group("Cl").size()
	Br_scene = get_tree().get_nodes_in_group("Br").size()

func _process(delta):
	$C.text = "%02d/" % inventary.C + "%02d" % C_scene
	$H.text = "%02d/" % inventary.H + "%02d" % H_scene
	$O.text = "%02d/" % inventary.O + "%02d" % O_scene
	$N.text = "%02d/" % inventary.N + "%02d" % N_scene
	$I.text = "%02d/" % inventary.I + "%02d" % I_scene
	$F.text = "%02d/" % inventary.F + "%02d" % F_scene
	$Cl.text = "%02d/" % inventary.Cl + "%02d" % Cl_scene
	$Br.text = "%02d/" % inventary.Br + "%02d" % Br_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
