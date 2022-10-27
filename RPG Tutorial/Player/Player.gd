extends KinematicBody2D

const PlayerHurtSound = preload("res://Player/PlayerHurtSoundStream.tscn")

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var FRICTION = 500
export var ROLL_SPEED = 125

enum { MOVE, ROLL, ATTACK }

var state = MOVE
var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO
var roll_vector = Vector2.DOWN
var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitBox = $HitboxPivot/Hitbox
onready var hurtBox = $Hurtbox
onready var blinkAnimation = $BlinkAnimation

func _ready():
	randomize()
	stats.connect("no_health", self, "on_death")
	animationTree.active = true
	swordHitBox.knockback_vector = Vector2.ZERO

func handle_input():
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()

func movement(delta: float):
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swordHitBox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()
	
	if Input.is_action_just_pressed("roll"):
		state = ROLL
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func move():
	velocity = move_and_slide(velocity)

func _physics_process(delta):
	match state:
		MOVE: move_state(delta)
		ROLL: roll_state(delta)
		ATTACK: attack_state(delta)

func move_state(delta: float):
	handle_input()
	movement(delta)
	
func attack_state(_delta: float):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func roll_state(_delta: float):
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()
	
func attack_animation_finished():
	state = MOVE
	
func roll_animation_started():
	hurtBox.manual_invincibility_on()

func roll_animation_finished():
	velocity *= 0.8
	state = MOVE
	hurtBox.manual_invincibility_off()

func on_death():
	queue_free()

func _on_Hurtbox_area_entered(_area):
	stats.health -= _area.damage
	hurtBox.start_invincibility(2)
	hurtBox.create_hit_effect()
	var player_sound = PlayerHurtSound.instance()
	get_tree().current_scene.add_child(player_sound)

func _on_Hurtbox_invincible_started():
	blinkAnimation.play("Start")

func _on_Hurtbox_invincible_ended():
	blinkAnimation.play("Stop")
