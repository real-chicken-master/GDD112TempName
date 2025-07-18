extends CharacterBody2D



const SPEED = 300.0
var left = false
var right = false
var up = false
var down = false
func _process(delta):
	if(left):
		global_position.x -= SPEED * delta
	if(right):
		global_position.x += SPEED * delta
	if(up):
		global_position.y -= SPEED * delta
	if(down):
		global_position.y += SPEED * delta

func _input(event):
	if event is InputEventKey:
		if(event.pressed):
			if event.keycode == KEY_LEFT:
				left = true
			if event.keycode == KEY_RIGHT:
				right = true
			if event.keycode == KEY_UP:
				up = true
			if event.keycode == KEY_DOWN:
				down = true
		if(event.is_released()):
			if event.keycode == KEY_LEFT:
				left = false
			if event.keycode == KEY_RIGHT:
				right = false
			if event.keycode == KEY_UP:
				up = false
			if event.keycode == KEY_DOWN:
				down = false
