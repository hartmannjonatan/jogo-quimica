extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false

func _process(delta):
	if count == 17:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Haleto de Arila")
			aux = true
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://scenes/rooms/Lab.tscn")

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "1":
			if coluna == "2" and element == "C":
				count += 1
				disable(1, 2)
				return true
			else:
				if coluna == "3" and element == "H":
					count += 1
					disable(1, 3)
					return true
				else: return false
		else:
			if linha == "2":
				if coluna == "1" and element == "LigDupla":
					getNodeGrid("2", "1", false).rotation_degrees = 45
					count += 1
					disable(2, 1)
					return true
				else:
					if coluna == "3" and element == "LigSimples":
						getNodeGrid("2", "3", false).rotation_degrees = 135
						count += 1
						disable(2,3)
						return true
					else: return false
			else:
				if linha == "3":
					if coluna == "0" and element == "C":
						count += 1
						disable(3,0)
						return true
					else:
						if coluna == "1" and element == "H":
							count += 1
							disable(3,1)
							return true
						else:
							if coluna == "4" and element == "C":
								count += 1
								disable(3,4)
								return true
							else:
								if coluna == "5" and element == "H":
									count += 1
									disable(3,5)
									return true
								else: return false
				else:
					if linha == "4":
						if coluna == "0" and element == "LigSimples":
							count += 1
							disable(4,0)
							return true
						else:
							if coluna == "4" and element == "LigDupla":
								count += 1
								disable(4,4)
								return true
							else: return false
					else:
						if linha == "5":
							if coluna == "0" and element == "C":
								count += 1
								disable(5,0)
								return true
							else:
								if coluna == "1" and element == "H":
									count += 1
									disable(5,1)
									return true
								else:
									if coluna == "4" and element == "C":
										count += 1
										disable(5,4)
										return true
									else:
										if coluna == "5" and element == "LigSimples":
											getNodeGrid("5", "5", false).rotation_degrees = 90
											count += 1
											disable(5,5)
											return true
										else:
											if coluna == "6" and element == "C":
												count += 1
												disable(5,6)
												return true
											else:
												if coluna == "7" and element == "H":
													getNodeGrid("5", "7", true).text = "3"
													count += 1
													disable(5,7)
													return true
												else: return false
						else:
							if linha == "6":
								if coluna == "1" and element == "LigDupla":
									getNodeGrid("6", "1", false).rotation_degrees = 135
									count += 1
									disable(6,1)
									return true
								else:
									if coluna == "3" and element == "LigSimples":
										getNodeGrid("6", "3", false).rotation_degrees = 45
										count += 1
										disable(6,3)
										return true
									else: return false
							else:
								if linha == "7":
									if coluna == "2" and element == "C":
										count += 1
										disable(7,2)
										return true
									else: return false
								else:
									if linha == "8":
										if coluna == "2" and element == "LigSimples":
											count += 1
											disable(8,2)
											return true
										else: return false
									else:
										if linha == "9":
											if coluna == "2" and element == "Cl":
												count += 1
												disable(9,2)
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
