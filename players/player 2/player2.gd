extends CharacterBody2D

var movemode = "platformer"
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
		print("Top down")
	if(movemode == "platformer"):
		rotation_degrees = 0
		var direction = Input.get_axis("left2","right2")
		velocity.x = SPEED * direction * 1.5
	move_and_slide()


func set_remote_transform(path):
	$RemoteTransform2D.set_remote_node(path.get_path())
