extends Control

var is_visible = false setget set_is_visible

func set_is_visible(value):
	is_visible = value
	get_tree().paused = is_visible
	visible = is_visible

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		self.is_visible = !is_visible
