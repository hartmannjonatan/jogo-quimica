extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false

func _process(delta):
	if count == 25:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Nitrocomposto")
			aux = true
		get_node("/root/AudioFx").play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/Propanonitrila.tscn")

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "0":
			if coluna == "0" and element == "C":
				count += 1 
				disable(0,0)
				return true
			else:
				if coluna == "1" and element == "H":
					getNodeGrid("0", "1", true).text = "3"
					count += 1 
					disable(0,1)
					return true
				else:
					if coluna == "2" and element == "LigSimples":
						getNodeGrid("0", "2", false).rotation_degrees = 90
						count += 1 
						disable(0,2)
						return true
					else:
						if coluna == "3" and element == "C":
							count += 1 
							disable(0,3)
							return true
						else:
							if coluna == "4" and element == "H":
								count += 1 
								disable(0,4)
								return true
							else:
								if coluna == "5" and element == "LigSimples":
									getNodeGrid("0", "5", false).rotation_degrees = 90
									count += 1 
									disable(0,5)
									return true
								else:
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
														getNodeGrid("0", "10", true).text = "2"
														count += 1 
														disable(0,10)
														return true
													else:
														if coluna == "11" and element == "LigSimples":
															getNodeGrid("0", "11", false).rotation_degrees = 90
															count += 1 
															disable(0,11)
															return true
														else:
															if coluna == "12" and element == "C":
																count += 1 
																disable(0,12)
																return true
															else:
																if coluna == "13" and element == "H":
																	count += 1 
																	disable(0,13)
																	return true
																else:
																	if coluna == "14" and element == "LigSimples":
																		getNodeGrid("0", "14", false).rotation_degrees = 90
																		count += 1 
																		disable(0,14)
																		return true
																	else:
																		if coluna == "15" and element == "C":
																			count += 1 
																			disable(0,15)
																			return true
																		else:
																			if coluna == "16" and element == "H":
																				count += 1 
																				disable(0,16)
																				return true
																			else:
																				if coluna == "17" and element == "LigDupla":
																					getNodeGrid("0", "17", false).rotation_degrees = 90
																					count += 1 
																					disable(0,17)
																					return true
																				else:
																					if coluna == "18" and element == "C":
																						count += 1 
																						disable(0,18)
																						return true
																					else:
																						if coluna == "19" and element == "H":
																							getNodeGrid("0", "19", true).text = "2"
																							count += 1 
																							disable(0,19)
																							return true
																						else: return false
		else:
			if linha == "1":
				if coluna == "3" and element == "LigSimples":
					count += 1 
					disable(1,3)
					return true
				else:
					if coluna == "12" and element == "LigSimples":
						count += 1 
						disable(1,12)
						return true
					else: return false
			
			else:
				if linha == "2":
					if coluna == "3" and element == "N":
						count += 1 
						disable(2,3)
						return true
					else:
						if coluna == "12" and element == "C":
							count += 1 
							disable(2,12)
							return true
						else:
							if coluna == "13" and element == "H":
								getNodeGrid("2", "13", true).text = "2"
								count += 1 
								disable(2,13)
								return true
							else: return false
				
				else:
					if linha == "3":
						if coluna == "2" and element == "LigDupla":
							getNodeGrid("3", "2", false).rotation_degrees = 45
							count += 1 
							disable(3,2)
							return true
						else:
							if coluna == "4" and element == "LigSimples":
								getNodeGrid("3", "4", false).rotation_degrees = 135
								count += 1 
								disable(3,4)
								return true
							else:
								if coluna == "12" and element == "LigSimples":
									count += 1 
									disable(3,12)
									return true
								else: return false
					
					else:
						if linha == "4":
							if coluna == "1" and element == "O":
								count += 1 
								disable(4,1)
								return true
							else:
								if coluna == "5" and element =="O":
									count += 1 
									disable(4,5)
									return true
								else:
									if coluna == "12" and element == "C":
										count += 1 
										disable(4,12)
										return true
									else:
										if coluna == "13" and element == "H":
											getNodeGrid("4", "13", true).text = "3"
											count += 1 
											disable(4,13)
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
