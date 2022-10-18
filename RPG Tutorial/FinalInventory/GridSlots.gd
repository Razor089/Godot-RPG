extends GridContainer

func _ready():
	PlayerStats.inventory.connect("item_changes", self, "_on_item_changed")
	update_inventory()

func update_inventory():
	for item_index in PlayerStats.inventory.items.size():
		update_inventory_slot(item_index)

func update_inventory_slot(item_index):
	var inventory_slot_display = get_child(item_index)
	var item = PlayerStats.inventory.items[item_index]
	inventory_slot_display.display_item(item)

func _on_item_changed(indexes):
	print("item update, indexes: ", indexes)
	for item_index in indexes:
		print("Index: ", item_index)
		update_inventory_slot(item_index)
