extends Node

onready var inventary = $"/root/Inventary"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_C_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.add("C")
		queue_free()


func _on_H_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.add("H")
		queue_free()

func _on_O_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.add("O")
		queue_free()


func _on_N_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.add("N")
		queue_free()

func _on_Cl_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.add("Cl")
		queue_free()


func _on_Br_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.add("Br")
		queue_free()
