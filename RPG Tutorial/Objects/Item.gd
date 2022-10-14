extends Node2D

const carrot = preload("res://Objects/Crops/carrot.png")
const potion = preload("res://UI/Potion.png")
onready var textureRect = $TextureRect

func _ready():
	if randi() % 2 == 0:
		textureRect.texture = carrot
	else:
		textureRect.texture = potion
