extends AudioStreamPlayer

func _on_PlayerHurtSoundStream_finished():
	queue_free()
