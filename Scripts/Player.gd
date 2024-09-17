extends KinematicBody2D

var scene_width = OS.window_size.x
const sprite_side_width = 50
export var speed = 350

func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		if position.x < scene_width - sprite_side_width:
			move_and_slide(Vector2(speed,0))
		else:
			position.x = sprite_side_width
	if Input.is_key_pressed(KEY_LEFT):
		if position.x > sprite_side_width:
			move_and_slide(Vector2(-speed,0))
		else:
			position.x = scene_width - sprite_side_width
		
	if Input.is_key_pressed(KEY_SPACE):
		# shoot
		pass
