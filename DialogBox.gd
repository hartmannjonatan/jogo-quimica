extends NinePatchRect

onready var text := $text
onready var timer := $Timer

var msg_queue: Array = []

func _ready():
	text.bbcode_text = ""
	$".".visible = false

func add_message(_msg: Array):
	if not visible:
		show()
		
	msg_queue.append_array(_msg)
	show_message()

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		show_message()

func show_message() -> void:
	if not timer.is_stopped():
		text.visible_characters = text.bbcode_text.length()
		return
	
	if msg_queue.size() == 0:
		hide()
		return
	
	var _msg: String = msg_queue.pop_front()
	
	text.visible_characters = 0
	
	text.bbcode_text = _msg
	print(msg_queue)
	timer.start()


func _on_Timer_timeout():
	if text.visible_characters == text.bbcode_text.length():
		timer.stop()
	text.visible_characters += 1
