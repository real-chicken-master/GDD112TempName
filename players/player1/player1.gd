extends CharacterBody2D


const SPEED = 300.0
var left = false
var right = false
var up = false
var down = false

var Xvelocity = 0
var Yvelocity = 0


func _process(delta):
	if(left):
		Xvelocity -= SPEED
	if(right):
		Xvelocity = SPEED
	if(up):
		Yvelocity = -SPEED
	move_and_collide(Vector2(Xvelocity,Yvelocity))


func _input(event):
	if event is InputEventKey:
		if(event.pressed):
			if event.keycode == KEY_A:
				left = true
			if event.keycode == KEY_D:
				right = true
			if event.keycode == KEY_W:
				Yvelocity -= SPEED
			if event.keycode == KEY_S:
				Yvelocity += SPEED
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
	$RemoteTransform2D.set_remote_node(path.get_path())
