extends Node

export var max_health = 1 setget set_max_health
var inventory = preload("res://FinalInventory/Inventory.tres")
var health = max_health setget set_health

signal no_health
signal health_changed(value)
signal max_healt_changed(value)

func set_max_health(value):
	max_health = value
	health = min(health, max_health)
	emit_signal("max_healt_changed", max_health)

func set_health(value):
	health = value
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")

func _ready():
	self.health = max_health
