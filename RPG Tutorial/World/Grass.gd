extends Node2D

const GrassEffect = preload("res://GrassEffect.tscn")
const Crop = preload("res://Objects/Crops/Carrot.tscn")
export var no_hit = false;

func create_grass_effect():
	var effect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(effect)
	effect.global_position = global_position
	
func create_crop():
	var crop = Crop.instance()
	get_parent().call_deferred("add_child", crop)
	crop.global_position = global_position

func _on_Hurtbox_area_entered(_area):
	if no_hit != true:
		create_grass_effect()
		var num = rand_range(0, 100)
		if num <= 10:
			create_crop()
		queue_free()
