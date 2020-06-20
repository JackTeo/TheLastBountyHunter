extends Label

var drawTextSpeed:int = 0
var chatterLimit:int = 1000 # max characters in chatbox
var dialog = ["In 2071, after a serious accident made the earth unsuitable for survival, humans have colonized most of the rocky planets and moons of the solar system.",
"With the increase in crime rates, the solar system police department established a legalized contract system in which registered bounty hunters pursued criminals in exchange for rewards.",
"The protagonist is Spike Spiegel, an exiled former Black Dragon group killer.",
"He and former policeman Jet Black formed a team to complete various tasks.",
#The focus of the main story arc is Spike and his deadly rival Viggis, 
#an ambitious criminal affiliated with the Red Dragon Group. 
#Spike and Viggis used to be partners and friends, but Viggis had great ambitions 
#to develop the Red Dragon Group into a terrorist organization. 
#In order to wipe out this terrorist organization, Black ordered Spike to destroy Viggis. 
#After the elimination of Viggis's men, the final battle finally wiped out Viggis 
"and got the bounty to complete the task."] # list of story lines
var skip_to_scene #scene to skip to

var page = 0

func loadSkipToScene(scene):
	skip_to_scene = scene
	pass

func _ready():
	pass

# Print story time line box
func _showChatter():
	if drawTextSpeed < chatterLimit: # print 1 char at a time
		drawTextSpeed += 1
		self.visible_characters = drawTextSpeed

func _process(delta):
	_showChatter()

func _on_Next_pressed():
	if page < dialog.size()-1:
		page += 1
		set_text(dialog[page])
	else:
		get_tree().change_scene("res://Levels/Level_1.tscn")

func _on_Skip_pressed():
	get_tree().change_scene(skip_to_scene)
