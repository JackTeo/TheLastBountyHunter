extends "res://Characters/Character.gd"

var acceleration = 1700
var motion = Vector2.ZERO

func _physics_process(delta):
	if isDead == false:
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
	
		# disable for mobile use
		$Body.look_at(get_global_mouse_position())
		
		var rot_dir = 0
		if Input.is_action_pressed('turn_right'):
			rot_dir += 1
		if Input.is_action_pressed('turn_left'):
			rot_dir -= 1
		rotation += 5 * rot_dir * delta

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(movement):
	motion += movement
	motion = motion.clamped(speed)

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Body.global_rotation - 0.01)
		emit_signal('shoot', Bullet, $Body/Muzzle.global_position, dir)
		$AnimationPlayer.play("muzzle_flash")
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Assets/sfx/gun_player.wav")
		player.volume_db = -12
		player.play()
		get_node("/root/Hud").update_scores(-10)

func take_damage(amount):
	if isDead == false:
		isHurt = true
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Assets/sfx/gun-1a.wav")
		player.volume_db = -12
		player.play()
		$Body/isHurt_Timer.stop()
		$Body/isHurt_Timer.start()
		health -= amount
		get_node("/root/Hud").update_scores(-10)
		$Body/isHurt_anime.play("isHurt")
		if health <= 0:
			if get_node(".").name == "Player":
				dead()
			else:
				explode()
		elif health <= 40:
			$Body/isHurt_anime.get_animation("isHurt").length = 0.5
			$Body/isHurt_anime.get_animation("isHurt").step = 0.25
