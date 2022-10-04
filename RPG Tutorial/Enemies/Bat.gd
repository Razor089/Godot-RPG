extends KinematicBody2D

const ACCELERATION = 200 
const MAX_SPEED = 40
const FRICTION = 200
const KNOCKBACK = 130

onready var stats = $Stats
var velocity: Vector2 = Vector2.ZERO

func _ready():
	var animatedSprite = get_node("AnimatedSprite")
	animatedSprite.play("Fly")

func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	velocity = area.knockback_vector * KNOCKBACK
	

func _on_Stats_no_health():
	queue_free()
