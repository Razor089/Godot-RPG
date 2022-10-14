extends Panel

var itemClass = preload("res://Objects/Item.tscn")
var item = null 

func _ready():
	if randi() % 2 == 0:
		item = itemClass.instance()
		add_child(item)
