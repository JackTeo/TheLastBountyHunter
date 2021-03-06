extends "res://Characters/Character.gd"

onready var parent = get_parent()
onready var initial_dir = Vector2(1, 0).rotated($Body.global_rotation) # Initial body direction

export (float) var rotation_speed
export (int) var detect_radius

var target = null
var current_dir = null

func _ready():
	var circle = CircleShape2D.new()
	$DetectRadius/CollisionShape2D.shape = circle
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius

func _physics_process(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		position = Vector2()
	else:
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Body.global_rotation)
		$Body.global_rotation = current_dir.linear_interpolate(target_dir, rotation_speed * 0.1 * delta).angle()
		if target_dir.dot(current_dir) > 0.98: # aiming accuracy
			shoot()
		if target_dir.dot(current_dir) > 0.995: # aiming accuracy
			shoot()
	else:
		var current_dir = Vector2(1, 0).rotated($Body.global_rotation)
		$Body.global_rotation = current_dir.linear_interpolate(initial_dir, rotation_speed * 0.1 * delta).angle()
	

func _on_DetectRadius_body_entered(body):
	if body.name == "Player":
		target = body


func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
