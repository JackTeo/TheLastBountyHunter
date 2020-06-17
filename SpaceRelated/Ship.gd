extends KinematicBody2D

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65

var rot_dir = 0
var acc = Vector2() # ship ACCELERATE forward
var vel = Vector2() # velocity
var pos = Vector2() # position

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		rot_dir -= rot_speed * delta
	if Input.is_action_pressed("ui_right"):
		rot_dir += rot_speed * delta
	if Input.is_action_pressed("ui_up"):
		acc = Vector2(thrust, 0).rotated(rot_dir)
	else:
		acc = Vector2(0, 0)
#	if Input.is_action_pressed("ui_down"):
#		rot_dir += rot_speed * delta
	acc += vel * -friction
	vel += acc * delta
	pos += vel * delta
	
	rotation = rot_dir + PI/2
	position = pos
