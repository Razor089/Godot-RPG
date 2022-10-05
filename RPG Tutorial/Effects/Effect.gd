extends AnimatedSprite

func _ready():
	var error = connect("animation_finished", self, "_on_animation_finished")
	check_error(error)
	frame = 0
	play("Animate")

func _on_animation_finished():
	queue_free()

func check_error(error):
	if error != OK:
		print("Error: ", error)
