extends Node2D

const doorPlayer = preload("res://World/DoorUnlockPlayer.tscn")

var activated_columns = 0 

signal all_pillar_active

func add_active_column():
	activated_columns += 1
	if activated_columns >= 4:
		emit_signal("all_pillar_active")
		if doorPlayer != null:
			var door_audio = doorPlayer.instance()
			get_tree().current_scene.add_child(door_audio)
