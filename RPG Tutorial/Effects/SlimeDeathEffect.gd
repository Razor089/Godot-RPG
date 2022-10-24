extends AnimatedSprite

func _ready():
	var error = connect("animation_finished", self, "_on_animation_finished")
	if error != OK:
		print("Slime: Error in connect")
	frame = 0
	play("animation")

func _on_animation_finished():
	queue_free()
