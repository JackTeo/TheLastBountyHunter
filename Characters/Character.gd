extends KinematicBody2D

signal shoot
#signal health_changed
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (int) var health
export (float) var gun_cooldown

var initial_health = null
var velocity = Vector2()
var can_shoot = true
var isHurt = false

func _ready():
	$GunTimer.wait_time = gun_cooldown
	initial_health = health

func _physics_process(delta):
	var motion = velocity.normalized() * speed
	move_and_slide(motion, velocity)

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Body.global_rotation - 0.01)
		emit_signal('shoot', Bullet, $Body/Muzzle.global_position, dir)

func take_damage(amount):
	isHurt = true
	$Body/isHurt_Timer.stop()
	$Body/isHurt_Timer.start()
	health -= amount
	$Body/isHurt_anime.play("isHurt")
	if health <= 0:
		queue_free()
	elif health <= 40:
		$Body/isHurt_anime.get_animation("isHurt").length = 0.5
		$Body/isHurt_anime.get_animation("isHurt").step = 0.25
	print(health)

func _on_GunTimer_timeout():
	can_shoot = true

func _on_isHurt_Timer_timeout():
	print("ishurt timer end")
	isHurt = false
	$Body/notHurt_Timer.stop()
	$Body/notHurt_Timer.start()
	print("not hurt timer start")

func _on_notHurt_Timer_timeout():
	print("not hurt timer end")
	if isHurt == false:
		health = initial_health
		$Body/isHurt_anime.stop()
		$Body/isHurt_anime.seek(0, true)
		$Body/isHurt_anime.get_animation("isHurt").length = 1
		$Body/isHurt_anime.get_animation("isHurt").step = 0.5
		print("hp full")
