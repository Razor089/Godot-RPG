extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts
var error = OK setget set_error

onready var heartUIEmpty = $HeartUIEmpty
onready var heartUIFull = $HeartUIFull

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 15
	
func set_max_hearts(value):
	max_hearts = max(value, 1)
	hearts = min(hearts, max_hearts)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 15
	
func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	self.error = PlayerStats.connect("health_changed", self, "set_hearts")
	self.error = PlayerStats.connect("max_healt_changed", self, "set_max_hearts")

func set_error(value):
	error = value
	if error != OK:
		print("Errore!")
