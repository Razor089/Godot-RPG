extends KinematicBody2D

export var ACCELERATION = 200
export var FRICTION = 200
export var MAX_SPEED = 40
export var KNOCKBACK = 140

var deathEffect = preload("res://Effects/SlimeDeathEffect.tscn")

enum { IDLE, JUMP }

export(int) var timer_wait = 2

onready var stats = $Stats
onready var hurtbox = $Hurtbox
onready var blinkAnimation = $BlinkAnimation
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var timer = $StateTimer
onready var playerDetection = $PlayerDetection
onready var sprite = $Sprite
var state = IDLE
var velocity = Vector2.ZERO
export var chase = false

func _ready():
	animationTree.active = true

func idle_state(_delta: float):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * _delta)
	seek_player()

func jump_state(_delta: float):
	var player = playerDetection.player
	if player != null:
		accelerate_towards_point(player.global_position, _delta)
		animationState.travel("Jump")
	else:
		state = IDLE
	sprite.flip_h = velocity.x < 0

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0

func _physics_process(delta):
	match state:
		IDLE:
			idle_state(delta)
		JUMP:
			jump_state(delta)
	if chase:
		velocity = move_and_slide(velocity)

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func _on_Hurtbox_area_entered(area):
	animationState.travel("Hurt")
	var direction = area.knockback_vector
	sprite.flip_h = direction.x > 0
	stats.health -= area.damage
	hurtbox.create_hit_effect()
	hurtbox.start_invincibility(0.6)

func create_death_effect():
	var death_effect = deathEffect.instance()
	get_parent().add_child(death_effect)
	death_effect.global_position = global_position

func _on_Hurtbox_invincible_started():
	blinkAnimation.play("Blink")

func _on_Hurtbox_invincible_ended():
	blinkAnimation.play("Stop")

func _on_Stats_no_health():
	create_death_effect()
	queue_free()

func update_state():
	state = pick_random_state([IDLE, JUMP])
	print("State: ", state)

func start_timer(duration):
	if timer.time_left <= 0:
		timer.start(duration)

func _on_StateTimer_timeout():
	update_state()

func jump_animation_ended():
	state = IDLE
	animationState.travel("Idle")

func hurt_animation_ended():
	state = IDLE
	animationState.travel("Idle")

func seek_player():
	if playerDetection.can_see_player():
		start_timer(timer_wait)
