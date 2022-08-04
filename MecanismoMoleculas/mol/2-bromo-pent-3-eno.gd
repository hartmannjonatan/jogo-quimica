extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false
onready var AudioFx = get_node("/root/AudioFx")

func _process(delta):
	if count == 10:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Haleto de Alquila")
			aux = true
		AudioFx.play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://Win.tscn")
	print(count)

func verifica(element: String, linha: String, coluna: String) -> bool:#esse
	if element != "default":#esse
		if linha == "1":
			if coluna == "1" and element == "H":
				getNodeGrid("1", "1", true).text = "3"
				count += 1 
				disable(1,1)
				return true
			else:
				if coluna == "2" and element == "LigSimples":
					getNodeGrid("1", "2", false).rotation_degrees = 90
					count += 1 
					disable(1,2)
					return true
				else: 
					if coluna == "3" and element == "C":
						count += 1 
						disable(1,3)
						return true
					else:
						if coluna == "4" and element == "H":
							count += 1 
							disable(1,4)
							return true
						else:
							if coluna == "5" and element == "LigSimples":
								getNodeGrid("1", "5", false).rotation_degrees = 90
								count += 1 
								disable(1,5)
								return true
							else: 
								if coluna == "6" and element == "C":
									count += 1 
									disable(1,6)
									return true
								else:
									if coluna == "7" and element == "H":
										count += 1 
										disable(1,7)
										return true
									else:
										if coluna == "9" and element == "C":
											count += 1 
											disable(1,9)
											return true
										else:
											if coluna == "10" and element == "H":
												count += 1 
												disable(1,10)
												return true
											else:
												if coluna == "11" and element == "LigSimples":
													getNodeGrid("1", "11", false).rotation_degrees = 90
													count += 1 
													disable(1,11)
													return true
												else: return false
		else:
			if linha == "2":
				if coluna == "3" and element == "LigSimples":
					count += 1 
					disable(2,3)
					return true
				else: return false
			else: return false
	else: return true

func getNodeGrid(linha: String, coluna: String, text: bool) -> Node:#essa funcao
	var path = "GridContainer/%s" % linha + "/%s" %coluna
	path = path + "/Sprite"
	if text:
		path = path + "/text"
	return get_node(path)

func disable(linha: int, coluna: int):
	var path = "GridContainer/" + String(linha) + "/" + String(coluna)
	get_node(path).disabled = true
