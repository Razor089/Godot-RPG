extends KinematicBody2D

export var ACCELERATION = 200 
export var MAX_SPEED = 40
export var FRICTION = 200
export var KNOCKBACK = 130
export var WANDER_TARGET_RANGE = 4

const DeathEffect = preload("res://Effects/DeathEffect.tscn")

enum { IDLE, CHASE, WANDER }

onready var stats = $Stats
onready var sprite = $Sprite
onready var playerDetection = $PlayerDetection
onready var hurtBox = $Hurtbox
onready var softCollision = $SoftCollision
onready var wanderController = $WanderController

var knockback: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var state = IDLE

func _ready():
	var animatedSprite = get_node("AnimatedSprite")
	animatedSprite.play("Fly")
	state = pick_random_state([IDLE, WANDER])

func knockback_move(delta: float):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)

func seek_player():
	if playerDetection.can_see_player():
		state = CHASE

func idle_state(_delta: float):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * _delta)
	seek_player()
	if wanderController.get_time_left() == 0:
		update_state()

func chase_state(_delta: float):
	var player = playerDetection.player
	if player != null:
		accelerate_towards_point(player.global_position, _delta)
	else:
		state = IDLE
	sprite.flip_h = velocity.x < 0

func wander_state(_delta: float):
	seek_player()
	if wanderController.get_time_left() == 0:
		update_state()
	
	accelerate_towards_point(wanderController.target_position, _delta)
	
	if global_position.distance_to(wanderController.target_position) <= WANDER_TARGET_RANGE:
		update_state()

func _physics_process(delta):
	knockback_move(delta)
	match state:
		IDLE:
			idle_state(delta)
		CHASE:
			chase_state(delta)
		WANDER:
			wander_state(delta)
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * 400 * delta
	move()
	
func update_state():
	state = pick_random_state([IDLE, WANDER])
	wanderController.start_wander_timer(rand_range(1, 3))

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0

func move():
	velocity = move_and_slide(velocity)

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * KNOCKBACK
	hurtBox.create_hit_effect()	

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func _on_Stats_no_health():
	create_death_effect()
	queue_free()

func create_death_effect():
	var death_effect = DeathEffect.instance()
	get_parent().add_child(death_effect)
	death_effect.global_position = global_position
