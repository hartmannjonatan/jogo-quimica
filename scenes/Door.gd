extends Area2D

export (String, "Room_01.tscn", "Room_02.tscn", "Room_03.tscn", "Room_04.tscn", "Lab.tscn") var room = "Lab.tscn"

func _ready():
	$enterRoom.play("transition")

func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		$changeRoom.play("transition")
		
func enterRoom():
	get_tree().change_scene("res://%s" % room)
