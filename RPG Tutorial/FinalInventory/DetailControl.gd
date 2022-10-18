extends Control

onready var iconTexture = $VBoxContainer/IconContainer/IconTexture
onready var labelDetail = $VBoxContainer/LabelDetail
onready var labelTitle = $VBoxContainer/Title

func set_item(item_texture, detail, title):
	iconTexture.texture = item_texture
	labelDetail.text = detail
	labelTitle.text = title

func set_detail(item_index):
	var item = PlayerStats.inventory.items[item_index]
	if item is Item:
		set_item(item.item_texture, item.detail, item.name)
	else:
		set_item(null, "", "")

func _on_Slot_selected(item_index):
	set_detail(item_index)


func _on_Slot2_selected(item_index):
	set_detail(item_index)


func _on_Slot3_selected(item_index):
	set_detail(item_index)


func _on_Slot4_selected(item_index):
	set_detail(item_index)


func _on_Slot5_selected(item_index):
	set_detail(item_index)


func _on_Slot6_selected(item_index):
	set_detail(item_index)


func _on_Slot7_selected(item_index):
	set_detail(item_index)


func _on_Slot8_selected(item_index):
	set_detail(item_index)


func _on_Slot9_selected(item_index):
	set_detail(item_index)


func _on_Slot10_selected(item_index):
	set_detail(item_index)
	

func _on_Slot11_selected(item_index):
	set_detail(item_index)


func _on_Slot12_selected(item_index):
	set_detail(item_index)


func _on_Slot13_selected(item_index):
	set_detail(item_index)


func _on_Slot14_selected(item_index):
	set_detail(item_index)


func _on_Slot15_selected(item_index):
	set_detail(item_index)


func _on_Slot16_selected(item_index):
	set_detail(item_index)
