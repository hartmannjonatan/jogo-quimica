extends Node


var background = load ("res://audios/theme.mp3")

func play_music():
	$Music.stream = background
	$Music.play()
