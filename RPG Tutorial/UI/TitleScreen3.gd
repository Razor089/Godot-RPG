extends Control

export var first_level = preload("res://World.tscn")

func _on_New_Game_button_up():
	var error = get_tree().change_scene_to(first_level)
	if error != OK:
		print("Errore nel cambio di scena")


func _on_Quit_button_up():
	get_tree().quit()
