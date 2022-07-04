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
		inventary.addOrRemove("C", 1, true)
		queue_free()


func _on_H_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("H", 1, true)
		queue_free()

func _on_O_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("O", 1, true)
		queue_free()


func _on_N_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("N", 1, true)
		queue_free()


func _on_I_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("I", 1, true)
		queue_free()


func _on_F_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("F", 1, true)
		queue_free()


func _on_Cl_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("Cl", 1, true)
		queue_free()


func _on_Br_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("getElementFx").play()
		inventary.addOrRemove("Br", 1, true)
		queue_free()
