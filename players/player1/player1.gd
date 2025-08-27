extends CharacterBody2D

@onready var coyote_timer_p_1 = $Coyote_TimerP1

#jump sound effect
@onready var player_jump_1 = $playerjump

#the current move mode of player 1
var move_mode = "topdown"
#the movement speed of player 1
const speed = 700


func _physics_process(_delta):
	#top down movement
	if(move_mode == "topdown"):
		#allow the players to collide with each other
		set_collision_mask_value(1,true)
		#get the vector of the inputs
		var direction = Input.get_vector("left1","right1","up1","down1")
		#set the velocity
		velocity = direction * speed
		#adjust the rotation
		rotation = direction.angle()
		#fix the 90 degree offset
		rotation_degrees += 90
	#platformer movement
	if(move_mode == "platformer"):
		#prevent the players to collide with each other
		set_collision_mask_value(1,false)
		#set rotation to 0
		rotation_degrees = 0
		#get the axis of the inputs
		var direction = Input.get_axis("left1","right1")
		#set the x velocity
		velocity.x = speed * direction * 1.5
		#jump
		#if the player is on the floor
		if(is_on_floor()):
			coyote_timer_p_1.start(0)
	#if the jump button is pressed
		if Input.is_action_just_pressed("up1"):
			if coyote_timer_p_1.time_left > 0 :
				coyote_timer_p_1.stop()
				player_jump_1.play()
				velocity.y -= 2222
				
				
		velocity.y += 100
	#move the player
	move_and_slide()

#connect to the split screen camera 
func set_remote_transform(path):
	#connect the camera and remote transform
	$RemoteTransform2D.set_remote_node(path.get_path())
