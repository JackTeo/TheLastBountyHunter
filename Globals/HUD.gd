extends CanvasLayer

var lives = 3

func update_lives(value):
	lives += value
	if lives == 0:
		pass
	elif lives == 1:
		$"SMargin/L-Container/Lives1".self_modulate
	elif lives == 2:
		pass
