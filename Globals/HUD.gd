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
var DEAD_LAYER = false

const CONTROL_SCREEN = preload("res://Scenes/ControlsScreen/ControlsScreen.tscn")


func _physics_process(delta):
	if $PauseLayer/Pause/BlackOverlay/ResumeBtn.is_hovered() == true:
		$PauseLayer/Pause/BlackOverlay/ResumeBtn.grab_focus()
	if $PauseLayer/Pause/BlackOverlay/RestartBtn.is_hovered() == true:
		$PauseLayer/Pause/BlackOverlay/RestartBtn.grab_focus()
	if $PauseLayer/Pause/BlackOverlay/MainMenuBtn.is_hovered() == true:
		$PauseLayer/Pause/BlackOverlay/MainMenuBtn.grab_focus()
	if $PauseLayer/Pause/BlackOverlay/ControlBtn.is_hovered() == true:
		$PauseLayer/Pause/BlackOverlay/ControlBtn.grab_focus()
#	if $DeadLayer/Dead/BlackOverlay/RestartBtn.is_hovered() == true:
#		$DeadLayer/Dead/BlackOverlay/RestartBtn.grab_focus()
#	if $DeadLayer/Dead/BlackOverlay/MainMenuBtn.is_hovered() == true:
#		$DeadLayer/Dead/BlackOverlay/MainMenuBtn.grab_focus()
#	if $DeadLayer/Dead/BlackOverlay/ExitBtn.is_hovered() == true:
#		$DeadLayer/Dead/BlackOverlay/ExitBtn.grab_focus()
		
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

func BACK_TO_PAUSE():
	$PauseLayer/Pause/BlackOverlay/ResumeBtn.grab_focus()

func GET_DEAD_LAYER_STATUS():
	return DEAD_LAYER

func DEAD_LAYER():
	DEAD_LAYER = true
	$DeadAnimation.play("dead_animation")
	yield(get_tree().create_timer($DeadAnimation/DeadTimer.wait_time),"timeout")
	get_tree().paused = true
	$DeadLayer/Dead/BlackOverlay.visible = true
	$DeadLayer/Dead/BlackOverlay/RestartBtn.grab_focus()


func _on_ResumeBtn_pressed():
	get_tree().paused = false
	$PauseLayer/Pause.visible = false


func _on_RestartBtn_pressed():
	if DEAD_LAYER == false:
		$PauseLayer/Pause.visible = false
	else:
		DEAD_LAYER = false
		$DeadLayer/Dead.modulate = "00ffffff"
		$DeadLayer/Dead/BlackOverlay.visible = false
	HUD_reset()
	Start_Timer()
	get_tree().paused = false
	get_tree().change_scene("res://Levels/Level_1.tscn")
	$"SMargin/L-Container/Lives2".self_modulate = "ffffff"
	$"SMargin/L-Container/Lives3".self_modulate = "ffffff"


func _on_MainMenuBtn_pressed():
	if DEAD_LAYER == false:
		$PauseLayer/Pause.visible = false
	else:
		DEAD_LAYER = false
		$DeadLayer/Dead.modulate = "00ffffff"
		$DeadLayer/Dead/BlackOverlay.visible = false
	HUD_reset()
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
	$"SMargin/L-Container/Lives2".self_modulate = "ffffff"
	$"SMargin/L-Container/Lives3".self_modulate = "ffffff"


func _on_ControlBtn_pressed():
	SET_SCREEN_NAME("ControlScreen")
	var a = CONTROL_SCREEN.instance()
	$PauseLayer/Pause/BlackOverlay.add_child(a)


func _on_ExitBtn_pressed():
	get_tree().quit()
