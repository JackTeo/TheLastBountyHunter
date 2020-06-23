extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if (get_node("/root/Hud").GET_SCREEN_NAME() == "TitleScreen"):
			pass
		elif (get_node("/root/Hud").GET_SCREEN_NAME() == "IntroScreen"):
			pass
		else:
			var pause = not get_tree().paused
			get_tree().paused = pause
			visible = pause
			$BlackOverlay/ResumeBtn.grab_focus()
