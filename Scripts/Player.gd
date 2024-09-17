extends KinematicBody2D

var scene_width = OS.window_size.x
const sprite_side_width = 50
export var speed = 350

var spaceship = preload("res://Sprites/Players/spaceship.png")
var spaceship_right = preload("res://Sprites/Players/spaceship_right.png")
var spaceship_left = preload("res://Sprites/Players/spaceship_left.png")

onready var bullet = preload("res://Scenes/Includes/Bullet.tscn")
onready var bulletPosition = get_node("BulletPosition")

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
		$spaceship.texture = spaceship
		
	if Input.is_key_pressed(KEY_SPACE):
		if not isShooting:
			shoot()

func shoot():
	var bulletInstance = bullet.instance()
	bulletInstance.position = Vector2(position.x, 495)
	get_parent().add_child(bulletInstance)
	
	isShooting=true
	yield(get_tree().create_timer(0.2),"timeout")
	isShooting=false
