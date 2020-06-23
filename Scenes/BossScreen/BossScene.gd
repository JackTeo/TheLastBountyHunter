extends Node

export (String, FILE,"*.tscn") var skip_to_scene
export (Texture) var person1
export (Texture) var person2

var dialog_index = 0
var finished = false
var dialog = [
	"PROFESSOR K!!!!",
	"I have been waiting for you…",
	"And now, your death awaits!",
	"I will not let your ambition come true!"
	] # list of story lines

var personName = [
	"Spike",
	"K",
	"K",
	"Spike"
]

onready var pNode1 = get_node("Person1") #to add a person sprite
onready var pNode2 = get_node("Person2") #to add a person sprite

func _ready():
	get_node("/root/Hud").Stop_Timer()
	get_node("/root/Hud").SET_SCREEN_NAME("IntroScreen")
	$Panel/HBoxContainer/NextBtn.grab_focus()
	load_dialog()

func _physics_process(delta):
	if $Panel/HBoxContainer/NextBtn.is_hovered() == true:
		$Panel/HBoxContainer/NextBtn.grab_focus()
	if $Panel/HBoxContainer/SkipBtn.is_hovered() == true:
		$Panel/HBoxContainer/SkipBtn.grab_focus()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$Panel/RichTextLabel.bbcode_text = dialog[dialog_index]
		$Panel/RichTextLabel.percent_visible = 0
		$Panel/PersonLabel.bbcode_text = personName[dialog_index]
		$Tween.interpolate_property(
			$Panel/RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		get_node("/root/Hud").Start_Timer()
		get_tree().change_scene("res://Levels/Level_Boss.tscn")
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true

func _on_NextBtn_pressed():
	load_dialog()


func _on_SkipBtn_pressed():
	get_node("/root/Hud").Start_Timer()
	get_tree().change_scene(skip_to_scene)
	

