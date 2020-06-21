extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if (get_node("/root/Hud").GET_SCREEN_NAME() == "TitleScreen"):
			pass
		else:
			var pause = not get_tree().paused
			get_tree().paused = pause
			visible = pause
			$BlackOverlay/ControlBtn.grab_focus()
