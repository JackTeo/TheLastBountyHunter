extends Node2D

onready var player = $"."/Player

func _ready():
	set_camera_limits()
	player.connect('shoot', self, 'onGunShoot')
	Input.set_custom_mouse_cursor(load("res://Assets/UI/crossair_white.png"), Input.CURSOR_ARROW, Vector2(8, 8))

func set_camera_limits():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func onGunShoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)
