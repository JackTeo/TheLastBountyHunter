extends Node

func _ready():
	$VBoxContainer/StartBtn.grab_focus()
	get_node("/root/Hud").SET_SCREEN_NAME("TitleScreen")
#	var player = AudioStreamPlayer.new()
#	self.add_child(player)
#	player.stream = load("res://Assets/music/theme.wav")
#	player.play()
#	get_node("/root/HUD").update_level(1)

func _physics_process(delta):
	if $VBoxContainer/StartBtn.is_hovered() == true:
		$VBoxContainer/StartBtn.grab_focus()
	if $VBoxContainer/ControlBtn.is_hovered() == true:
		$VBoxContainer/ControlBtn.grab_focus()
	if $VBoxContainer/CreditBtn.is_hovered() == true:
		$VBoxContainer/CreditBtn.grab_focus()
	if $VBoxContainer/ExitBtn.is_hovered() == true:
		$VBoxContainer/ExitBtn.grab_focus()

func _on_StartBtn_pressed():
	get_node("/root/Hud").HUD_reset()
	get_node("/root/Hud").SET_SCREEN_NAME("Level")
	get_tree().change_scene("res://Scenes/IntroScreen/IntroScene.tscn")


func _on_ControlBtn_pressed():
	get_tree().change_scene("res://Scenes/ControlsScreen/ControlsScreen.tscn")


func _on_CreditBtn_pressed():
	get_tree().change_scene("res://Scenes/CreditScreen/CreditScreen.tscn")


func _on_ExitBtn_pressed():
	get_tree().quit()
