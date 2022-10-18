extends Resource
class_name Item

enum Types { CONSUMABLE, EQUIP }

export(String) var name = ""
export(Texture) var item_texture = null
export(Types) var category = Types.CONSUMABLE
export(String) var detail = ""
