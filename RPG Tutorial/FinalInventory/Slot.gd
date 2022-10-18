extends Control

onready var texture_item = $TextureSlot/TextureItem

signal pressed(position)
signal selected(item_index)

func display_item(item):
	if item is Item:
		texture_item.texture = item.item_texture
	else:
		texture_item.texture = null

func _on_TextureSlot_pressed():
	emit_signal("pressed", rect_global_position)


func _on_TextureSlot_focus_entered():
	emit_signal("selected", get_index())
