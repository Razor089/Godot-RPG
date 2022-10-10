extends AudioStreamPlayer

func _on_ColumnAudioPlayer_finished():
	queue_free()
