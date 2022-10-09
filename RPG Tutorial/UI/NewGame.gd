extends Control

export var new_game = preload("res://World.tscn")

func _on_TextureButton_button_up():
	get_tree().change_scene_to(new_game)
