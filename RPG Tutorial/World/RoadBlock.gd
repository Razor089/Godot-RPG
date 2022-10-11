extends KinematicBody2D

onready var final_point = $FinalPosition
onready var final_pos = global_position + final_point.position
var velocity = Vector2.ZERO

export(bool) var can_move = false
export var ACCELERATION = 100
export var FRICTION = 100
export var MAX_SPEED = 40

func _ready():
	var error = GameController.connect("all_pillar_active", self, "unlock_passage")
	if error != OK:
		print("Errore")

func _physics_process(_delta):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * _delta)
	if can_move:
		accelerate_towards_point(final_pos, _delta)
		if global_position.distance_to(final_pos) <= 4:
			can_move = false
		move()

func unlock_passage():
	can_move = true

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)

func move():
	velocity = move_and_slide(velocity)
