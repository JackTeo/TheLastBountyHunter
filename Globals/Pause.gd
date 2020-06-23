extends Control

func _input(event):
	if (get_node("/root/Hud").GET_DEAD_LAYER_STATUS() == false):
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

#func _physics_process(delta):
#	if $BlackOverlay/ResumeBtn.is_hovered() == true:
#		$BlackOverlay/ResumeBtn.grab_focus()
#	if $BlackOverlay/RestartBtn.is_hovered() == true:
#		$BlackOverlay/RestartBtn.grab_focus()
#	if $BlackOverlay/MainMenuBtn.is_hovered() == true:
#		$BlackOverlay/MainMenuBtn.grab_focus()
#	if $BlackOverlay/ControlBtn.is_hovered() == true:
#		$BlackOverlay/ControlBtn.grab_focus()
