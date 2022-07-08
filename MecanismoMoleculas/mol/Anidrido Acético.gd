extends Control


onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false

func _process(delta):
	if count == 12:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Anidrido Acético")
			aux = true
		get_node("/root/AudioFx").play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://scenes/rooms/Lab.tscn")

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "0":
			if coluna == "5" and element == "O":
				count += 1 
				disable(0,5)
				return true
			else: return false
		
		else:
			if linha == "1":
				if coluna == "4" and element == "LigDupla":
					getNodeGrid("1", "4", false).rotation_degrees = 45
					count += 1 
					disable(1,4)
					return true
				else: return false 
				
			else:
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
								else: return false

				else: 
					if linha == "3":
						if coluna == "4" and element == "LigSimples":
							getNodeGrid("3", "4", false).rotation_degrees = 135
							count += 1 
							disable(3,4)
							return true
						else: return false
						
					else:
						if linha == "4":
							if coluna == "5" and element == "O":
								count += 1 
								disable(4,5)
								return true
							else: return false
							
						else:
							if linha == "5":
								if coluna == "4" and element == "LigSimples":
									getNodeGrid("5", "4", false).rotation_degrees = 45
									count += 1 
									disable(5,4)
									return true
								else: return false
							
							else:
								if linha == "6":
									if coluna == "0" and element == "C":
										count += 1 
										disable(6,0)
										return true
									else: 
										if coluna == "1" and element == "H":
											getNodeGrid("6", "1", true).text = "3"
											count += 1 
											disable(6,1)
											return true
										else: 
											if coluna == "2" and element == "LigSimples":
												getNodeGrid("6", "2", false).rotation_degrees = 90
												count += 1 
												disable(6,2)
												return true
											else:
												if coluna == "3" and element == "C":
													count += 1 
													disable(6,3)
													return true
												else: return false
								
								else:
									if linha == "7":
										if coluna == "4" and element == "LigDupla":
											getNodeGrid("7", "4", false).rotation_degrees = 135
											count += 1 
											disable(7,4)
											return true
										else: return false

									else:
										if linha == "8":
											if coluna == "5" and element == "O":
												count += 1 
												disable(8,5)
												return true
											else: return false
										else: return false
	else: return false

func getNodeGrid(linha: String, coluna: String, text: bool) -> Node: #essa funcao
	var path = "GridContainer/%s" % linha + "/%s" %coluna
	path = path + "/Sprite"
	if text:
		path = path + "/text"
	return get_node(path)

func disable(linha: int, coluna: int):
	var path = "GridContainer/" + String(linha) + "/" + String(coluna)
	get_node(path).disabled = true
