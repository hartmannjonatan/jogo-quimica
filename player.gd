extends KinematicBody2D

var velocidade = Vector2.ZERO
const VELOCIDADE_MAX = 100
const ACELERACAO = 500
const ATRITO = 800

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	var resultante = Vector2.ZERO
	resultante.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	resultante.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	resultante = resultante.normalized()
	
	if resultante != Vector2.ZERO:
		animationTree.set("parameters/Walk/blend_position", resultante)
		animationTree.set("parameters/Idle/blend_position", resultante)
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta)
		animationState.travel("getWalk")
	else:
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
		animationState.travel("Idle")

	move_and_slide(velocidade)
