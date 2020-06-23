extends Node

func _ready():
	$NextBtn.grab_focus()
	get_node("/root/Hud").SET_SCREEN_NAME("WinScreen")
	$Label.text = str(get_node("/root/Hud").GET_SCORES())
	
#	var player = AudioStreamPlayer.new()
#	self.add_child(player)
#	player.stream = load("res://Assets/Audio/bgm_title.wav")
#	player.play()
#	get_node("/root/HUD").update_level(1)


func _on_NextBtn_pressed():
	get_tree().change_scene("res://Scenes/CreditScreen/CreditScreen.tscn")
