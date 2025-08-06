extends CharacterBody2D

var movemode = "topdown"
const SPEED = 250.0
var left = false
var right = false
var up = false
var down = false
var canjump = true

func _physics_process(_delta):
	if(movemode == "topdown"):
		set_collision_mask_value(1,true)
		var direction = Input.get_vector("left2","right2","up2","down2")
		velocity = direction * SPEED
		rotation = direction.angle()
		rotation_degrees += 90
	if(movemode == "platformer"):
		set_collision_mask_value(1,false)
		rotation_degrees = 0
		var direction = Input.get_axis("left2","right2")
		velocity.x = SPEED * direction * 1.5
		if(is_on_floor()):
			if Input.is_action_just_pressed("up2"):
				velocity.y -= 2000
		else:
			velocity.y += 100
	move_and_slide()

func set_remote_transform(path):
	$RemoteTransform2D.set_remote_node(path.get_path())
