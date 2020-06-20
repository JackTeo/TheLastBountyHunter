extends Node


func _ready():
	$MarginContainer/BG/BackBtn.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackBtn_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
