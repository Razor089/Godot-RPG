extends GridContainer

var inventory = null

func _ready():
	inventory = PlayerStats.inventory
	inventory.connect("item_changes", self, "_on_item_changed")
	update_inventory()

func update_inventory():
	for item_index in inventory.items.size():
		update_inventory_slot(item_index)

func update_inventory_slot(item_index):
	var inventory_slot_display = get_child(item_index)
	var item = inventory.items[item_index]
	inventory_slot_display.display_item(item)

func _on_item_changed(indexes):
	for item_index in indexes:
		update_inventory_slot(item_index)
