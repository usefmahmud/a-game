extends Node2D

export var bulletSpeed = 450

func _process(delta):
	position -= transform.y * delta * bulletSpeed
	
	if not $VisibilityEnabler2D.is_on_screen():
		queue_free()
