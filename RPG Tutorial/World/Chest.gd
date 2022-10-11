extends StaticBody2D

onready var area = $Proximity
onready var pressX = $PressX
onready var sprite_open = $Opened

export var is_open = false setget set_is_open
var entered = false

func set_is_open(value):
	is_open = value

func _unhandled_input(event):
		if !is_open && entered && event.is_action_pressed("action"):
			self.is_open = true
			sprite_open.visible = true
			pressX.visible = false

func _on_Proximity_body_entered(_body):
	if !is_open:
		pressX.visible = true
		entered = true


func _on_Proximity_body_exited(_body):
	pressX.visible = false
