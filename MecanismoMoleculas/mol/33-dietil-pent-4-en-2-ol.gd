extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false

func _process(delta):
	if count == 21:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Álcool")
			aux = true
		get_node("/root/AudioFx").play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/1-hidroxi-2-metil-benzeno.tscn")
	print(count)

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "0":
			if coluna == "6" and element == "C":
				count += 1
				disable(0,6)
				return true
			else:
				if coluna == "7" and element == "H":
					getNodeGrid("0", "7", true).text = "2"
					count += 1
					disable(0,7)
					return true
				else:
					if coluna == "8" and element == "LigSimples":
						getNodeGrid("0", "8", false).rotation_degrees = 90
						count += 1
						disable(0,8)
						return true
					else: 
						if coluna == "9" and element == "C":
							count += 1
							disable(0,9)
							return true
						else: 
							if coluna == "10" and element == "H":
								getNodeGrid("0", "10", true).text = "3"
								count += 1
								disable(0,10)
								return true
							else: return false
		else:
			if linha == "2":
				if coluna == "5" and element == "LigSimples":
					getNodeGrid("2", "5", false).rotation_degrees = 90
					count += 1
					disable(2,5)
					return true
				else:
					if coluna == "4" and element == "H":
						count += 1
						disable(2,4)
						return true
					else:
						if coluna == "3" and element == "C":
							count += 1
							disable(2,3)
							return true
						else:
							if coluna == "2" and element == "LigDupla":
								getNodeGrid("2", "2", false).rotation_degrees = 90
								count += 1
								disable(2,2)
								return true
							else:
								if coluna == "1" and element == "H":
									getNodeGrid("2", "1", true).text = "2"
									count += 1
									disable(2,1)
									return true
								else:
									if coluna == "0" and element == "C":
										count += 1
										disable(2,0)
										return true
									else:
										if coluna == "7" and element == "LigSimples":
											getNodeGrid("2", "7", false).rotation_degrees = 90
											count += 1
											disable(2,7)
											return true
										else:
											if coluna == "8" and element == "C":
												count += 1
												disable(2,8)
												return true
											else:
												if coluna == "9" and element == "H":
													count += 1
													disable(2,9)
													return true
												else:
													if coluna == "10" and element == "LigSimples":
														getNodeGrid("2", "10", false).rotation_degrees = 90
														count += 1
														disable(2,10)
														return true
													else:
														if coluna == "12" and element == "H":
															getNodeGrid("2", "12", true).text = "3"
															count += 1
															disable(2,12)
															return true
														else: return false
			else:
				if linha == "3":
					if coluna == "6" and element == "LigSimples":
						count += 1
						disable(3,6)
						return true
					else:
						if coluna == "8" and element == "LigSimples":
							count += 1
							disable(3,8)
							return true
						else: return false
				else:
					if linha == "4":
						if coluna == "6" and element == "C":
							count += 1
							disable(4,6)
							return true
						else:
							if coluna == "7" and element == "H":
								getNodeGrid("4", "7", true).text = "2"
								count += 1
								disable(4,7)
								return true
							else:
								if coluna == "8" and element == "O":
									count += 1
									disable(4,8)
									return true
								else:
									if coluna == "9" and element == "H":
										count += 1
										disable(4,9)
										return true
									else: return false
					else:
						if linha == "5":
							if coluna == "6" and element == "LigSimples":
								count += 1
								disable(5,6)
								return true
							else: return false
						else:
							if linha == "6":
								if coluna == "6" and element == "C":
									count += 1
									disable(6,6)
									return true
								else:
									if coluna == "7" and element == "H":
										getNodeGrid("6", "7", true).text = "3"
										count += 1
										disable(6,7)
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
