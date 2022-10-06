extends Camera2D

var height = 0
var width = 0 

func _ready():
	height = offset.y * 2
	width = offset.x * 2
	
func _on_AreaEast_body_entered(_body):
	position.x += width
	print("Area East : ", position.x)

func _on_AreaWest_body_entered(_body):
	position.x -= width
	print("Area West : ", position.x)

func _on_AreaNorth_body_entered(_body):
	position.y -= height
	print("Area North : ", position.y)

func _on_AreaSouth_body_entered(_body):
	position.y += height
	print("Area South : ", position.y)
