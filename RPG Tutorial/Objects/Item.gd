extends Node2D

const potion_mana = preload("res://Objects/Potion_mana.png")
const potion = preload("res://Objects/Potion.png")
onready var textureRect = $TextureRect

func _ready():
	if randi() % 2 == 0:
		textureRect.texture = potion_mana
	else:
		textureRect.texture = potion
