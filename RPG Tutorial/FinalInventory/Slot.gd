extends Control

var inventory = preload("res://FinalInventory/Inventory.tres")

onready var texture_item = $TextureSlot/TextureItem

signal pressed(position)

func display_item(item):
	print("Id oggetto:", get_index())
	if item is Item:
		texture_item.texture = item.item_texture
	else:
		texture_item.texture = null

func get_drag_data(_position):
	var item_index = get_index()
	print("Id oggetto: ", item_index)
	var item = inventory.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var drag_previwe = TextureRect.new()
		drag_previwe.texture = item.item_texture
		set_drag_preview(drag_previwe)
		return data

func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")

func drop_data(_position, _data):
	pass


func _on_TextureSlot_pressed():
	emit_signal("pressed", rect_global_position)
