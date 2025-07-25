extends CharacterBody2D

var movemode = "topdown"
const SPEED = 200.0
var left = false
var right = false
var up = false
var down = false
var canjump = true
var jumping = false


func _physics_process(_delta):
	if(movemode == "topdown"):
		set_collision_mask_value(1,true)
		var direction = Input.get_vector("left1","right1","up1","down1")
		velocity = direction * SPEED
		rotation = direction.angle()
		rotation_degrees += 90
	if(movemode == "platformer"):
		set_collision_mask_value(1,false)
		rotation_degrees = 0
		var direction = Input.get_axis("left1","right1")
		velocity.x = SPEED * direction * 1.5
	move_and_slide()

func jump():
	velocity.y -= 200
	await get_tree().create_timer(0.01).timeout
	while(!is_on_floor()):
		velocity.y += 2
		await get_tree().create_timer(0.01).timeout
	canjump = true

func _input(event):
	if(event is InputEventKey):
			if(event.pressed):
				if(movemode == "platformer"):
					if(event.keycode == KEY_W):
						if(canjump):
							canjump = false
							jump()

func set_remote_transform(path):
	$RemoteTransform2D.set_remote_node(path.get_path())
