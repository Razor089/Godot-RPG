extends AudioStreamPlayer

func _on_DoorUnlockPlayer_finished():
	queue_free()
