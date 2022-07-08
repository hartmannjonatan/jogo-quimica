extends Node

var C = false
var H = false
var O = false
var N = false
var I = false
var F = false
var Cl = false
var Br = false
var room1 = false
var room2 = false
var room3 = false
var room4 = false
var grupos: Array

func _process(delta):
	if C and H and !room1:
		room1 = true
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/34-dimetil-5-etil-octano.tscn")
	
	if C and H and O and !room2:
		room2 = true
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/33-dietil-pent-4-en-2-ol.tscn")
	
	if C and H and O and N and !room3:
		room3 = true
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/3-metil-pent-2-enamida.tscn")
	
	if C and H and O and N and Br and Cl and !room4:
		room4 = true
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/1-cloro-2-metil-benzeno.tscn")
		

func _ready():
	pass;

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
			
func enterGroup(nome: String):
	grupos.append(nome)

