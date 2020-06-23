extends KinematicBody2D

signal shoot

export (PackedScene) var Bullet
export (int) var speed
export (int) var health
export (float) var gun_cooldown

onready var respawn_location = $".".global_position

var initial_health = null
var velocity = Vector2()
var can_shoot = true
var isHurt = false
var isDead = false

func _ready():
	$GunTimer.wait_time = gun_cooldown
	initial_health = health
#	$".".position = respawn_location

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Body.global_rotation - 0.01)
		emit_signal('shoot', Bullet, $Body/Muzzle.global_position, dir)
		$AnimationPlayer.play("muzzle_flash")

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
		elif health <= 40:
			$Body/isHurt_anime.get_animation("isHurt").length = 0.5
			$Body/isHurt_anime.get_animation("isHurt").step = 0.25

func dead():
	if (get_node("/root/Hud").update_lives() > 0):
		$AnimationPlayer.play("play_dead")
		$".".position = respawn_location
		isDead = true
		$Body/isHurt_anime.stop()
		health = initial_health
		yield(get_tree().create_timer($DeadTimer.wait_time),"timeout")
		isDead = false
	else:
		$AnimationPlayer.play("play_dead")
		isDead = true
		yield(get_tree().create_timer($DeadLayerTimer.wait_time),"timeout")
		get_node("/root/Hud").DEAD_LAYER()

func explode():
	$Body.hide()
	$Explosion.show()
	$Explosion.play()
	get_node("/root/Hud").update_scores(100)

func _on_GunTimer_timeout():
	can_shoot = true

func _on_isHurt_Timer_timeout():
	isHurt = false
	$Body/notHurt_Timer.stop()
	$Body/notHurt_Timer.start()

func _on_notHurt_Timer_timeout():
	if isHurt == false:
		health = initial_health
		$Body/isHurt_anime.stop()
		$Body/isHurt_anime.seek(0, true)
		$Body/isHurt_anime.get_animation("isHurt").length = 1
		$Body/isHurt_anime.get_animation("isHurt").step = 0.5

func _on_Explosion_animation_finished():
	queue_free()
