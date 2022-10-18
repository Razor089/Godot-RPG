extends Node2D

var item_potion = preload("res://FinalInventory/HealtPotion.tres")

func _on_Area2D_body_entered(body):
	print("Pozione presa")
	if PlayerStats.health >= 4:
		PlayerStats.inventory.add_item(item_potion)
	queue_free()
