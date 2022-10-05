extends Node2D

func create_grass_effect():
	var GrassEffect = load("res://GrassEffect.tscn")
	var effect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(effect)
	effect.global_position = global_position

func _on_Hurtbox_area_entered(_area):
	create_grass_effect()
	queue_free()
