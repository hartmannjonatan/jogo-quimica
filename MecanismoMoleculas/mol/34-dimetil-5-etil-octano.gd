extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false
onready var AudioFx = get_node("/root/AudioFx")

func _process(delta):
	if count == 23:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Hidrocarbonetos")
			aux = true
		AudioFx.play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://scenes/rooms/Lab.tscn")
	print(count)

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "0":
			if coluna == "11" and element == "LigSimples":
				getNodeGrid("0", "11", true).rotation_degrees = 90
				count += 1
				disable(0,11)
				return true
			else:
				if coluna == "10" and element == "H":
					getNodeGrid("0", "10", true).get_node("text").text = "2"
					count += 1
					disable(0,10)
					return true
				else:
					if coluna == "9" and element == "C":
						return true
						count += 1
						disable(0,9)
					else: return false
		else:
			if linha == "1":
				if coluna == "9" and element == "LigSimples":
					count += 1
					disable(1,9)
					return true
				else: return false
			else:
				if linha == "2":
					if coluna == "9" and element == "C":
						count += 1
						disable(2,9)
						return true
					else:
						if coluna == "10" and element == "H":
							getNodeGrid("2", "10", true).get_node("text").text = "2"
							count += 1
							disable(2,10)
							return true
						else: return false
				else:
					if linha == "3":
						if coluna == "9" and element == "LigSimples":
							count += 1
							disable(3,9)
							return true
						else: return false
					else:
						if linha == "4":
							if coluna == "9" and element == "C":
								count += 1
								disable(4,9)
								return true
							else:
								if coluna == "10" and element == "H":
									count += 1
									disable(4,10)
									return true
								else:
									if coluna == "11" and element == "LigSimples":
										getNodeGrid("4", "11", true).rotation_degrees = 90
										count += 1
										disable(4,11)
										return true
									else:
										if coluna == "12" and element == "C":
											count += 1
											disable(4,12)
											return true
										else:
											if coluna == "13" and element == "H":
												getNodeGrid("4", "13", true).get_node("text").text = "2"
												count += 1
												disable(4,13)
												return true
											else: 
												if coluna == "14" and element == "LigSimples":
													getNodeGrid("4", "14", true).rotation_degrees = 90
													count += 1
													disable(4,14)
													return true
												else:
													if coluna == "15" and element == "C":
														count += 1
														disable(4,15)
														return true
													else: 
														if coluna == "16" and element == "H":
															getNodeGrid("4", "16", true).get_node("text").text = "3"
															count += 1
															disable(4,16)
															return true
														else:
															if coluna == "8" and element == "LigSimples":
																getNodeGrid("4", "8", true).rotation_degrees = 90
																count += 1
																disable(4,8)
																return true
															else: 
																if coluna == "7" and element == "H":
																	count += 1
																	disable(4,7)
																	return true
																else: 
																	if coluna == "6" and element == "C":
																		count += 1
																		disable(4,6)
																		return true
																	else: 
																		if coluna == "5" and element == "LigSimples":
																			getNodeGrid("4", "5", true).rotation_degrees = 90
																			count += 1
																			disable(4,5)
																			return true
																		else: 
																			if coluna == "4" and element == "H":
																				count += 1
																				disable(4,4)
																				return true
																			else: 
																				if coluna == "3" and element == "C":
																					count += 1
																					disable(4,3)
																					return true
																				else: 
																					if coluna == "2" and element == "LigSimples":
																						getNodeGrid("4", "2", true).rotation_degrees = 90
																						count += 1
																						disable(4,2)
																						return true
																					else: 
																						if coluna == "1" and element == "C":
																							count += 1
																							disable(4,1)
																							return true
																						else: 
																							if coluna == "0" and element == "H":
																								getNodeGrid("4", "0", true).get_node("text").text = "3"
																								count += 1
																								disable(4,0)
																								return true
																							else: return false
						else:
							if linha == "5":
								if coluna == "3" and element == "LigSimples":
									count += 1
									disable(5,3)
									return true
								else: 
									if coluna == "6" and element == "LigSimples":
										count += 1
										disable(5,6)
										return true
									else: return false
							else:
								if linha == "6":
									if coluna == "3" and element == "C":
										count += 1
										disable(6,3)
										return true
									else: 
										if coluna == "4" and element == "H":
											getNodeGrid("6", "4", true).get_node("text").text = "2"
											count += 1
											disable(6,4)
											return true
										else: 
											if coluna == "6" and element == "C":
												count += 1
												disable(6,6)
												return true
											else: 
												if coluna == "7" and element == "H":
													getNodeGrid("6", "7", true).get_node("text").text = "3"
													count += 1
													disable(6,7)
													return true
												else: return false
								else:
									if linha == "7":
										if coluna == "3" and element == "LigSimples":
											count += 1
											disable(7,3)
											return true
										else: return false
									else:
										if linha == "8":
											if coluna == "3" and element == "C":
												count += 1
												disable(8,3)
												return true
											else:
												if coluna == "4" and element == "H":
													getNodeGrid("8", "4", true).get_node("text").text = "3"
													count += 1
													disable(8,4)
													return true
												else: return false
										else:
											return false
	else: return true

func getNodeGrid(linha: String, coluna: String, sprite: bool) -> Node:
	var text = "GridContainer/%s" % linha + "/%s" %coluna
	if sprite:
		text = text + "/Sprite"
	return get_node(text)
	
func disable(linha: int, coluna: int):
	var path = "GridContainer/" + String(linha) + "/" + String(coluna)
	get_node(path).disabled = true
