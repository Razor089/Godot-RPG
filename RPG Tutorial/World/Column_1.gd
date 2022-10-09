extends StaticBody2D

onready var words = $Words
onready var buttonA = $PressA
onready var collision = $CollisionShape2D

export var is_display = false setget set_is_display
var entered = false

func set_is_display(value):
	is_display = value

func _unhandled_input(event):
	if entered == true && event.is_action_pressed("action"):
		words.visible = true
		self.is_display = true
		buttonA.visible = false
		GameController.add_active_column()

func _on_Area2D_body_entered(_body):
	if self.is_display == false:
		buttonA.visible = true
		entered = true


func _on_Area2D_body_exited(_body):
	buttonA.visible = false
	entered = false
