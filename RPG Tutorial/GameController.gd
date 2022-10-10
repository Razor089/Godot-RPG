extends Node2D

const doorPlayer = preload("res://World/DoorUnlockPlayer.tscn")

var activated_columns = 0 

func add_active_column():
	activated_columns += 1
	if activated_columns >= 4:
		if doorPlayer != null:
			var door_audio = doorPlayer.instance()
			get_tree().current_scene.add_child(door_audio)
		print("Tutte le colonne attivate\nBoss disponibile")
