extends Control

onready var buttonUse = $VBoxContainer/ButtonUse
onready var buttonCancel = $VBoxContainer/ButtonCancel
var is_visible = false setget set_is_visible
var last_slot

signal cancel(last_slot)

func set_is_visible(_value):
	visible = _value
	if visible:
		if PlayerStats.inventory.is_consumable(last_slot):
			buttonUse.grab_focus()
		else:
			buttonUse.disabled = true
			buttonCancel.grab_focus()
		


func _on_ButtonCancel_button_up():
	self.is_visible = false
	emit_signal("cancel", last_slot)


func _on_ButtonUse_button_up():
	var item = PlayerStats.inventory.items[last_slot]
	match item.name:
		"Health Potion":
			PlayerStats.health = 4
			PlayerStats.inventory.remove_item(last_slot)
			self.is_visible = false
			emit_signal("cancel", last_slot)
