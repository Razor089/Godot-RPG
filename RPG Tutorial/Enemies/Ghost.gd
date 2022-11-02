extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
var state

enum { IDLE, CHASE, ATTACK }

func _ready():
	state = IDLE
	animationTree.active = true

func _physics_process(_delta):
	match state:
		IDLE:
			pass
		CHASE:
			pass
		ATTACK:
			pass

func idle_state(_delta):
	pass

func chase_state(_delta):
	pass

func attack_state(_delta):
	pass
