extends CharacterBody2D


const SPEED = 200.0
var left = false
var right = false
var up = false
var down = false




func _physics_process(_delta):
	var direction = Input.get_vector("left1","right1","up1","down1")
	velocity = direction * SPEED
	rotation = direction.angle()
	rotation_degrees += 90
	move_and_slide()


func set_remote_transform(path):
	$RemoteTransform2D.set_remote_node(path.get_path())
