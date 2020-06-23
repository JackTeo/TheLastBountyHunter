extends "res://Characters/Enemy.gd"


func _process(delta):
	pass


func take_damage(amount):
	if isDead == false:
		isHurt = true
		$Body/isHurt_Timer.stop()
		$Body/isHurt_Timer.start()
		health -= amount
		$Body/isHurt_anime.play("isHurt")
		if health <= 0:
			if get_node(".").name == "Player":
				dead()
			else:
				explode()
				get_tree().change_scene("res://Scenes/WinScreen/WinScreen.tscn")
		elif health <= 40:
			$Body/isHurt_anime.get_animation("isHurt").length = 0.5
			$Body/isHurt_anime.get_animation("isHurt").step = 0.25
