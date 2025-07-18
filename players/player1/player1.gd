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
			if event.keycode == KEY_A:
				left = true
			if event.keycode == KEY_D:
				right = true
			if event.keycode == KEY_W:
				up = true
			if event.keycode == KEY_S:
				down = true
		if(event.is_released()):
			if event.keycode == KEY_A:
				left = false
			if event.keycode == KEY_D:
				right = false
			if event.keycode == KEY_W:
				up = false
			if event.keycode == KEY_S:
				down = false

func set_remote_transform(path):
	$RemoteTransform2D.remote_path = path.get_path()
