extends CanvasLayer

var lives = 3

func update_lives():
	lives -= 1
	if lives == 0:
		lives = 3
		$"SMargin/L-Container/Lives2".self_modulate = "ffffff"
		$"SMargin/L-Container/Lives3".self_modulate = "ffffff"
		get_tree().change_scene("res://Scenes/DeadScreen/DeadScreen.tscn")
	elif lives == 1:
		$"SMargin/L-Container/Lives2".self_modulate = "00ffffff"
		$"SMargin/L-Container/Lives3".self_modulate = "00ffffff"
	elif lives == 2:
		$"SMargin/L-Container/Lives2".self_modulate = "ffffff"
		$"SMargin/L-Container/Lives3".self_modulate = "00ffffff"
	
	print(lives)
	return lives
