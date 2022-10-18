extends Control

onready var context_menu = $InventoryContextMenu
onready var grid = $MainBoxContainer/ControlGrid/GridSlots

var is_visible = false setget set_is_visible

func set_is_visible(value):
	is_visible = value
	get_tree().paused = is_visible
	visible = is_visible
	var slot = get_node("MainBoxContainer/ControlGrid/GridSlots/Slot/TextureSlot")
	slot.grab_focus()
	

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		self.is_visible = !is_visible


func _on_Slot_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 0
	context_menu.is_visible = true


func _on_Slot2_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 1
	context_menu.is_visible = true


func _on_Slot3_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 2
	context_menu.is_visible = true


func _on_Slot4_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 3
	context_menu.is_visible = true


func _on_Slot5_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 4
	context_menu.is_visible = true


func _on_Slot6_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 5
	context_menu.is_visible = true


func _on_Slot7_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 6
	context_menu.is_visible = true


func _on_Slot8_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 7
	context_menu.is_visible = true


func _on_Slot9_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 8
	context_menu.is_visible = true


func _on_Slot10_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 9
	context_menu.is_visible = true


func _on_Slot11_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 10
	context_menu.is_visible = true


func _on_Slot12_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 11
	context_menu.is_visible = true


func _on_Slot13_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 12
	context_menu.is_visible = true


func _on_Slot14_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 13
	context_menu.is_visible = true


func _on_Slot15_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 14
	context_menu.is_visible = true


func _on_Slot16_pressed(position):
	context_menu.rect_global_position = position
	context_menu.rect_position.x += 30
	context_menu.rect_position.y += 15
	context_menu.last_slot = 15
	context_menu.is_visible = true


func _on_InventoryContextMenu_cancel(last_slot):
	var slot = grid.get_child(last_slot)
	slot.get_child(0).grab_focus()


func _on_PauseMenu_show_menu():
	self.is_visible = false
