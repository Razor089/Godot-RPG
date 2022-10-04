extends Node2D

func _on_PassageBox_body_entered(_body):
	var camera = get_parent()
	camera.position.y -= 180
