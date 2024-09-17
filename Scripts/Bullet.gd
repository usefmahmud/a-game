extends Node2D

export var bulletSpeed = 250
var laser_shoot_sound = preload("res://Audio/laser_shoot.wav")

func _ready():
	$AudioStreamPlayer2D.stream = laser_shoot_sound
	$AudioStreamPlayer2D.play()

func _process(delta):
	position -= transform.y * delta * bulletSpeed
	
	yield(get_tree().create_timer(2.5),"timeout")
	queue_free()
