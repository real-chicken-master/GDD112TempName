extends Area2D

const speed = 7
var player_array = []
var target_pos

func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		player_array.push_front(players)
	target_pos = (player_array[randi_range(0,1)].global_position)

func _process(delta):
	position += target_pos * speed * delta



#const speed = 250
#var player_array = []
#var target_pos
#func _ready():
	#for players in get_tree().get_nodes_in_group("player"):
		#player_array.push_front(players)
	#target_pos = (player_array[randi_range(0,1)].global_position)
#
#func _process(delta):
	#move_toward(global_position.x,target_pos.x,speed)
	#move_and_slide()
