extends Area2D

export(String, FILE, "*.tscn") var next_stage

func _on_Portal_body_entered(body):
	print(body)
	if "Player" in body.name:
		get_tree().change_scene(next_stage)
		

#func _physics_process(delta):
#	$AnimatedSprite.play("idle")
