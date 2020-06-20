extends Node

export (String, FILE,"*.tscn") var skip_to_scene
export (Texture) var person1
export (Texture) var person2

var dialog_index = 0
var finished = false
var dialog = [
	"In 2071, after a serious accident made the earth unsuitable for survival, humans have colonized most of the rocky planets and moons of the solar system.",
	"With the increase in crime rates, the solar system police department established a legalized contract system in which registered bounty hunters pursued criminals in exchange for rewards.",
	"The protagonist, Spike is an exiled former Yakuza Group killer. He and a former policeman, Yua formed a team to complete various tasks.",
	"The focus of the main story is Spike and his deadly rival, Kato Hakase or Professor-K in short, an ambitious criminal affiliated with the Yakuza Group.",
	"Spike and K used to be partners and friends, but K had great ambitions to develop the Yakuza Group into a terrorist organization.",
	"In order to wipe out this terrorist organization, Yua ordered Spike to destroy K and get the bounty to complete the task."
	] # list of story lines

onready var pNode1 = get_node("Person1") #to add a person sprite
onready var pNode2 = get_node("Person2") #to add a person sprite

func _ready():
	$Panel/HBoxContainer/NextBtn.grab_focus()
	pNode1.texture = person1
	pNode2.texture = person2
	load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$Panel/RichTextLabel.bbcode_text = dialog[dialog_index]
		$Panel/RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$Panel/RichTextLabel, "percent_visible", 0, 1, 10,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		get_tree().change_scene("res://Levels/Level_1.tscn")
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true

func _on_NextBtn_pressed():
	load_dialog()


func _on_SkipBtn_pressed():
	get_tree().change_scene(skip_to_scene)
