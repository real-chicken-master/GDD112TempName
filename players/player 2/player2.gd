extends CharacterBody2D

<<<<<<< HEAD
var movemode = "topdown"
=======

>>>>>>> 3c17372a08ce4cb4d91d799d206e12a3f163c91d
const SPEED = 200.0
var left = false
var right = false
var up = false
var down = false




func _physics_process(_delta):
	if(movemode == "topdown"):
		var direction = Input.get_vector("left2","right2","up2","down2")
		velocity = direction * SPEED
		rotation = direction.angle()
		rotation_degrees += 90
		move_and_slide()


func set_remote_transform(path):
	$RemoteTransform2D.set_remote_node(path.get_path())
