extends AudioStreamPlayer2D

func _on_AudioPlayer_finished():
	queue_free()
