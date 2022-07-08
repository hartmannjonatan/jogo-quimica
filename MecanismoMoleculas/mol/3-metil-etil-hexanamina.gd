extends Control

onready var grid = $GridContainer
onready var inventary = $"/root/Inventary"
var count = 0
var aux = false

func _process(delta):
	if count == 23:
		for linha in range (0,9):
			for col in range (0,21):
				var path = String(linha) + "/" + String(col)
				var btn = grid.get_node(path)
				btn.disabled
		if !aux:
			inventary.enterGroup("Amina")
			aux = true
		get_node("/root/AudioFx").play_success()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://MecanismoMoleculas/mol/5-etil-2-nitrohept-6-eno.tscn")
	print(count)

func verifica(element: String, linha: String, coluna: String) -> bool:
	if element != "default":
		if linha == "0":
			if coluna == "0" and element == "H":
				count += 1 
				disable(0,0)
				return true
			else: return false
			 
		else:
			if linha == "1":
				if coluna == "1" and element == "LigSimples":
					getNodeGrid("1", "1", false).rotation_degrees = 135
					count += 1 
					disable(1,1)
					return true
				else: return false
			
			else: 
				if linha == "2":
					if coluna == "2" and element == "N":
						count += 1 
						disable(2,2)
						return true
					else:
						if coluna == "3" and element == "LigSimples":
							getNodeGrid("2", "3", false).rotation_degrees = 90
							count += 1 
							disable(2,3)
							return true
						else: 
							if coluna == "4" and element == "C":
								count += 1 
								disable(2,4)
								return true
							else:
								if coluna == "5" and element == "H":
									getNodeGrid("2", "5", true).text = "2"
									count += 1 
									disable(2,5)
									return true
								else:
									if coluna == "6" and element == "LigSimples":
										getNodeGrid("2", "6", false).rotation_degrees = 90
										count += 1 
										disable(2,6)
										return true
									else: 
										if coluna == "7" and element == "C":
											count += 1 
											disable(2,7)
											return true
										else:
											if coluna == "8" and element == "H":
												getNodeGrid("2", "8", true).text = "2"
												count += 1 
												disable(2,8)
												return true
											else:
												if coluna == "9" and element == "LigSimples":
													getNodeGrid("2", "9", false).rotation_degrees = 90
													count += 1 
													disable(2,9)
													return true
												else: 
													if coluna == "10" and element == "C":
														count += 1 
														disable(2,10)
														return true
													else:
														if coluna == "11" and element == "H":
															count += 1 
															disable(2,11)
															return true
														else:
															if coluna == "12" and element == "LigSimples":
																getNodeGrid("2", "12", false).rotation_degrees = 90
																count += 1 
																disable(2,12)
																return true
															else:
																if coluna == "13" and element == "C":
																	count += 1 
																	disable(2,13)
																	return true
																else:
																	if coluna == "14" and element == "H":
																		getNodeGrid("2", "14", true).text = "2"
																		count += 1 
																		disable(2,14)
																		return true
																	else:
																		if coluna == "15" and element == "LigSimples":
																			getNodeGrid("2", "15", false).rotation_degrees = 90
																			count += 1 
																			disable(2,15)
																			return true
																		else:
																			if coluna == "16" and element == "C":
																				count += 1 
																				disable(2,16)
																				return true
																			else:
																				if coluna == "17" and element == "H":
																					getNodeGrid("2", "17", true).text = "2"
																					count += 1 
																					disable(2,17)
																					return true
																				else:
																					if coluna == "18" and element == "LigSimples":
																						getNodeGrid("2", "18", false).rotation_degrees = 90
																						count += 1 
																						disable(2,18)
																						return true
																					else:
																						if coluna == "19" and element == "C":
																							count += 1 
																							disable(2,19)
																							return true
																						else:
																							if coluna == "20" and element == "H":
																								getNodeGrid("2", "20", true).text = "3"
																								count += 1 
																								disable(2,20)
																								return true
																							else: return false
				
				else:
					if linha == "3":
						if coluna == "1" and element == "LigSimples":
							getNodeGrid("3", "1", false).rotation_degrees = 45
							count += 1 
							disable(3,1)
							return true
						else:
							if coluna == "10" and element == "LigSimples":
								count += 1 
								disable(3,10)
								return true
							else: return false
		
					else:
						if linha == "4":
							if coluna == "0" and element == "H":
								count += 1 
								disable(4,0)
								return true
							else:
								if coluna == "10" and element == "C":
									count += 1 
									disable(4,10)
									return true
								else:
									if coluna == "11" and element == "H":
										getNodeGrid("4", "11", true).text = "2"
										count += 1 
										disable(4,11)
										return true
									else: return false
						
						else:
							if linha == "5":
								if coluna == "10" and element == "LigSimples":
									count += 1 
									disable(5,10)
									return true
								else: return false
								
							else:
								if linha == "6":
									if coluna == "10" and element == "C":
										count += 1 
										disable(6,10)
										return true
									else:
										if coluna == "11" and element == "H":
											getNodeGrid("6", "11", true).text = "3"
											count += 1 
											disable(6,11)
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
