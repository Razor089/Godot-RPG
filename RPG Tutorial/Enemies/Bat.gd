extends KinematicBody2D

export var ACCELERATION = 200 
export var MAX_SPEED = 40
export var FRICTION = 200
export var KNOCKBACK = 130

const DeathEffect = preload("res://Effects/DeathEffect.tscn")

enum { IDLE, CHASE, WANDER }

onready var stats = $Stats
onready var sprite = $Sprite
onready var playerDetection = $PlayerDetection
onready var hurtBox = $Hurtbox
onready var softCollision = $SoftCollision

var knockback: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var state = IDLE

func _ready():
	var animatedSprite = get_node("AnimatedSprite")
	animatedSprite.play("Fly")

func move():
	knockback = move_and_slide(knockback)

func idle_state(_delta: float):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * _delta)
	if playerDetection.can_see_player():
		state = CHASE

func chase_state(_delta: float):
	var player = playerDetection.player
	if player != null:
		var desired_direction = (player.global_position - global_position).normalized()
		velocity = velocity.move_toward(desired_direction * MAX_SPEED, ACCELERATION * _delta)
	else:
		state = IDLE
	sprite.flip_h = velocity.x < 0

func wander_state(_delta: float):
	pass

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	move()
	match state:
		IDLE:
			idle_state(delta)
		CHASE:
			chase_state(delta)
		WANDER:
			wander_state(delta)
	velocity = move_and_slide(velocity)
	

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * KNOCKBACK
	hurtBox.create_hit_effect()
	

func _on_Stats_no_health():
	create_death_effect()
	queue_free()

func create_death_effect():
	var death_effect = DeathEffect.instance()
	get_parent().add_child(death_effect)
	death_effect.global_position = global_position
