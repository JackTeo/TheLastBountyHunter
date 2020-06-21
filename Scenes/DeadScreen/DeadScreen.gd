extends Node

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/RestartBtn.grab_focus()

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/RestartBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/RestartBtn.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/MainMenuBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/MainMenuBtn.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/ExitBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/ExitBtn.grab_focus()

func _on_RestartBtn_pressed():
	get_node("/root/Hud").HUD_reset()
	get_node("/root/Hud").Start_Timer()
	get_tree().change_scene("res://Levels/Level_1.tscn")

func _on_MainMenuBtn_pressed():
	get_node("/root/Hud").HUD_reset()
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")

func _on_ExitBtn_pressed():
	get_tree().quit()
