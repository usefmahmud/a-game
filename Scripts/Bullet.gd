extends Node2D

export var bulletSpeed = 250
var laser_shoot_sound = preload("res://Audio/laser_shoot.wav")

func _process(delta):
	position -= transform.y * delta * bulletSpeed
	
	if not $VisibilityEnabler2D.is_on_screen():
		queue_free()
