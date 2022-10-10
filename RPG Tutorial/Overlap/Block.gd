extends StaticBody2D

onready var collision = $CollisionShape2D

func _process(_delta):
	if GameController.activated_columns == 4:
		queue_free()
