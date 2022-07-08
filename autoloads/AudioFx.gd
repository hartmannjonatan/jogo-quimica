extends Node

func play_error():
	$Error.play()
	yield(get_tree().create_timer(0.5), "timeout")
	$Error.stop()
		
	
func play_success():
	$Success.play()
	yield(get_tree().create_timer(1.91), "timeout")
	$Success.stop()
