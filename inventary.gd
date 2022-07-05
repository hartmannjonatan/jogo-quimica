extends Node

var C = false
var H = false
var O = false
var N = false
var I = false
var F = false
var Cl = false
var Br = false

func _ready():
	pass # Replace with function body.

func add(element: String):
	match element:
		"C":
			C = true
		"H":
			H = true
		"O":
			O = true
		"N":
			N = true
		"Cl":
			Cl = true
		"Br":
			Br = true
