extends Node2D

const player = preload("res://Objects/Crops/HpUpEffect.tscn")
export var health = 1

func _on_AreaCarrot_body_entered(_body):
	PlayerStats.health += health
	var effect = player.instance()
	get_tree().current_scene.add_child(effect)
	queue_free()
