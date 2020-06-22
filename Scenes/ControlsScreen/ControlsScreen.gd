extends Node


func _ready():
	$BackBtn.grab_focus()

func _on_BackBtn_pressed():
	if (get_node("/root/Hud").GET_SCREEN_NAME() == "PauseScreen"):
		get_node("/root/Hud").BACK_TO_PAUSE()
		queue_free()
	else:
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
