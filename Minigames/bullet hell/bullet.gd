extends Area2D

const speed = 250
var player_array = []
var target
func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		player_array.push_front(players)
	target = (player_array[randi_range(0,1)].global_position)

func _process(delta):
	move_toward(global_position,target.global_position,speed)
