extends "res://Characters/Character.gd"

var acceleration = 1700
var motion = Vector2.ZERO

func _physics_process(delta):
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	velocity.x = -int(LEFT) + int(RIGHT)
	velocity.y = -int(UP) + int(DOWN)

	if velocity == Vector2.ZERO:
		apply_friction(acceleration * delta)
	else:
		apply_movement(velocity * acceleration * delta)
	motion = move_and_slide(motion)

	# firing bullet
	if Input.is_action_pressed("left_click"):
		shoot()

	$Body.look_at(get_global_mouse_position())

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(movement):
	motion += movement
	motion = motion.clamped(speed)
