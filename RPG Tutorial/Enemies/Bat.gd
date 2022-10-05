extends KinematicBody2D

const ACCELERATION = 200 
const MAX_SPEED = 40
const FRICTION = 200
const KNOCKBACK = 130

const DeathEffect = preload("res://Effects/DeathEffect.tscn")

enum { IDLE, CHASE, WANDER }

onready var stats = $Stats
var knockback: Vector2 = Vector2.ZERO
var state = IDLE

func _ready():
	var animatedSprite = get_node("AnimatedSprite")
	animatedSprite.play("Fly")

func move():
	knockback = move_and_slide(knockback)

func idle_state(delta: float):
	pass

func chase_state(_delta: float):
	pass

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
	
	

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * KNOCKBACK
	

func _on_Stats_no_health():
	create_death_effect()
	queue_free()

func create_death_effect():
	var death_effect = DeathEffect.instance()
	get_parent().add_child(death_effect)
	death_effect.global_position = global_position
