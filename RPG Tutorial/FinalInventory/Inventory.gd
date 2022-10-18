extends Resource
class_name Inventory

signal item_changes(indexes)

const MAX_ITEMS = 16

export(Array, Resource) var items = [
	null, null, null, null, null,
	null, null, null, null, null,
	null, null, null, null, null,
	null, null, null, null, null
]

func add_item(item):
	for indexes in items.size():
		if items[indexes] == null:
			items[indexes] = item
			emit_signal("item_changes", [indexes])
			return

func is_consumable(index) -> bool:
	if items[index] == null:
		return false
	return items[index].category == Item.Types.CONSUMABLE

func set_item(item_index, item):
	var previous_item = items[item_index]
	items[item_index] = item
	emit_signal("item_changes", [item_index])
	return previous_item

func swap(item_index, target_item_index):
	var previous_item = items[target_item_index]
	items[target_item_index] = items[item_index]
	items[item_index] = previous_item
	emit_signal("item_changes", [item_index, target_item_index])

func remove_item(item_index):
	var previous_item = items[item_index]
	items[item_index] = null
	emit_signal("item_changes", [item_index])
	return previous_item
