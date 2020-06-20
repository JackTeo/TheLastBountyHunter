extends Node

func _ready():
#	set_camera_limits()
#	get_node("/root/HUD").layer = -10
	$MarginContainer/VBoxContainer/VBoxContainer/StartBtn.grab_focus()
#	var player = AudioStreamPlayer.new()
#	self.add_child(player)
#	player.stream = load("res://Assets/Audio/bgm_title.wav")
#	player.play()
#	get_node("/root/HUD").update_level(1)

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/StartBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/StartBtn.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/ControlBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/ControlBtn.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/CreditBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/CreditBtn.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/ExitBtn.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/ExitBtn.grab_focus()

#func _on_TextureButton_pressed():
#	get_node("/root/HUD").update_healthbar(100)
#	get_tree().change_scene("res://TitleScreens/IntroScene.tscn")

func _on_StartBtn_pressed():
	pass # Replace with function body.


func _on_ControlBtn_pressed():
	get_tree().change_scene("res://Scenes/ControlsScreen/ControlsScreen.tscn")


func _on_CreditBtn_pressed():
	get_tree().change_scene("res://Scenes/CreditScreen/CreditScreen.tscn")


func _on_ExitBtn_pressed():
	get_tree().quit()
