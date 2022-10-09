extends Node2D

var activated_columns = 0 

func add_active_column():
	activated_columns += 1
	if activated_columns >= 4:
		print("Tutte le colonne attivate\nBoss disponibile")
