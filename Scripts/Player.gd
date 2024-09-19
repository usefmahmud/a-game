extends KinematicBody2D

var scene_width = OS.window_size.x
const sprite_side_width = 50
export var speed = 550

var spaceship_idle = preload("res://Sprites/Players/spaceship.png")
var spaceship_right = preload("res://Sprites/Players/spaceship_right.png")
var spaceship_left = preload("res://Sprites/Players/spaceship_left.png")

onready var bullet = preload("res://Scenes/Includes/Bullet.tscn")
onready var bulletPosition = get_node("BulletPosition")

var AudioPlayer = preload("res://Scenes/Includes/AudioPlayer.tscn")
var laser_shoot_sound = preload("res://Audio/laser_shoot.wav")

var isShooting = false

func _process(delta):
	var is_moving = false
	if Input.is_key_pressed(KEY_RIGHT):
		if position.x < scene_width - sprite_side_width:
			move_and_slide(Vector2(speed,0))
			$spaceship.texture = spaceship_right
			
			is_moving = true
		else:
			position.x = sprite_side_width
			
	if Input.is_key_pressed(KEY_LEFT):
		if position.x > sprite_side_width:
			move_and_slide(Vector2(-speed,0))
			$spaceship.texture = spaceship_left
			
			is_moving = true
		else:
			position.x = scene_width - sprite_side_width
	
	if not is_moving:
		$spaceship.texture = spaceship_idle
		
	if Input.is_key_pressed(KEY_SPACE):
		if not isShooting:
			shoot()

func shoot():
	var AudioPlayerInstance = AudioPlayer.instance()
	AudioPlayerInstance.stream = laser_shoot_sound
	AudioPlayerInstance.play()
	
	var BulletInstance = bullet.instance()
	BulletInstance.position = Vector2(position.x, 495)
	
	get_parent().add_child(AudioPlayerInstance)
	get_parent().add_child(BulletInstance)
	
	isShooting=true
	yield(get_tree().create_timer(0.15),"timeout")
	isShooting=false
