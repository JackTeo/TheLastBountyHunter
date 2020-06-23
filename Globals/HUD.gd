extends CanvasLayer

var lives = 3
var scores = 0
var initial_Timer = 3000
var milliseconds = 0
var seconds = 0
var minutes = 0
var pause
var SCREEN_NAME
var LEVEL_LOCATION

const CONTROL_SCREEN = preload("res://Scenes/ControlsScreen/ControlsScreen.tscn")


func _process(delta):
	if pause == false or initial_Timer > 0:
		minutes = initial_Timer / 10 / 60
		seconds = initial_Timer / 10 % 60
		milliseconds = initial_Timer % 10
		$"SMargin/R-Container/Value".text = str(minutes).pad_zeros(2)+":"+str(seconds).pad_zeros(2)+":"+str(milliseconds)
		$"SMargin/M-Container/Value".text = str(scores)

func update_lives():
	lives -= 1
	if lives == 0:
		$Timer.stop()
		layer = -10
		lives = 3
		$"SMargin/L-Container/Lives2".self_modulate = "ffffff"
		$"SMargin/L-Container/Lives3".self_modulate = "ffffff"
		get_tree().change_scene("res://Scenes/DeadScreen/DeadScreen.tscn")
	elif lives == 1:
		$"SMargin/L-Container/Lives2".self_modulate = "00ffffff"
		$"SMargin/L-Container/Lives3".self_modulate = "00ffffff"
	elif lives == 2:
		$"SMargin/L-Container/Lives2".self_modulate = "ffffff"
		$"SMargin/L-Container/Lives3".self_modulate = "00ffffff"
	return lives

func update_scores(value):
	scores += value

func _on_Timer_timeout():
	initial_Timer -= 1

func HUD_reset():
	initial_Timer = 3000
	lives = 3
	scores = 0
	layer = -10

func Start_Timer():
	layer = 1
	$Timer.start()

func GET_SCREEN_NAME():
	return SCREEN_NAME

func SET_SCREEN_NAME(name):
	SCREEN_NAME = name

#func SET_LOCATION(value):
#	LEVEL_LOCATION = value

func BACK_TO_PAUSE():
	$PauseLayer/Pause/BlackOverlay/ResumeBtn.grab_focus()


func _on_ResumeBtn_pressed():
	get_tree().paused = false
	$PauseLayer/Pause.visible = false


func _on_RestartBtn_pressed():
	HUD_reset()
	Start_Timer()
	get_tree().paused = false
	$PauseLayer/Pause.visible = false
	get_tree().change_scene("res://Levels/Level_1.tscn")
	

func _on_MainMenuBtn_pressed():
	HUD_reset()
	get_tree().paused = false
	$PauseLayer/Pause.visible = false
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")


func _on_ControlBtn_pressed():
	SET_SCREEN_NAME("ControlScreen")
	var a = CONTROL_SCREEN.instance()
	$PauseLayer/Pause/BlackOverlay.add_child(a)


