extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false

func _process(delta):
	if count == 8:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Nitrila")
			aux = true
		get_node("/root/AudioFx").play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://scenes/rooms/Lab.tscn")

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "2":
			if coluna == "0" and element == "C":
				count += 1 
				disable(2,0)
				return true
			else:
				if coluna == "1" and element == "H":
					getNodeGrid("2", "1", true).text = "3"
					count += 1 
					disable(2,1)
					return true
				else:
					if coluna == "2" and element == "LigSimples":
						getNodeGrid("2", "2", false).rotation_degrees = 90
						count += 1 
						disable(2,2)
						return true
					else:
						if coluna == "3" and element == "C":
							count += 1 
							disable(2,3)
							return true
						else:
							if coluna == "4" and element == "H":
								getNodeGrid("2", "4", true).text = "2"
								count += 1 
								disable(2,4)
								return true
							else:
								if coluna == "5" and element == "LigSimples":
									getNodeGrid("2", "5", false).rotation_degrees = 90
									count += 1 
									disable(2,5)
									return true
								else:
									if coluna == "6" and element == "C":
										count += 1 
										disable(2,6)
										return true
									else:
										if coluna == "7" and element == "LigTripla":
											getNodeGrid("2", "7", false).rotation_degrees = 90
											count += 1 
											disable(2,7)
											return true
										else:
											if coluna == "8" and element == "N":
												count += 1 
												disable(2,8)
												return true
											else: return false
		else: return false
	else: return true

func getNodeGrid(linha: String, coluna: String, text: bool) -> Node:
	var path = "GridContainer/%s" % linha + "/%s" %coluna
	path = path + "/Sprite"
	if text:
		path = path + "/text"
	return get_node(path)

func disable(linha: int, coluna: int):
	var path = "GridContainer/" + String(linha) + "/" + String(coluna)
	get_node(path).disabled = true
