extends Node

var C = 0
var H = 0
var O = 0
var N = 0
var I = 0
var F = 0
var Cl = 0
var Br = 0

func _ready():
	pass # Replace with function body.

func addOrRemove(element: String, n: int, add: bool):
	match element:
		"C":
			if add:
				C += n
			else: C -= n
		"H":
			if add:
				H += n
			else: H -= n
		"O":
			if add:
				O += n
			else: O -= n
		"N":
			if add:
				N += n
			else: N -= n
		"I":
			if add:
				I += n
			else: I -= n
		"F":
			if add:
				F += n
			else: F -= n
		"Cl":
			if add:
				Cl += n
			else: Cl -= n
		"Br":
			if add:
				Br += n
			else: Br -= n

func printElements():
	print("C = %d" % C)
	print("H = %d" % H)
	print("O = %d" % O)
	print("N = %d" % N)
	print("I = %d" % I)
	print("F = %d" % F)
	print("Cl = %d" % Cl)
	print("Br = %d" % Br)
