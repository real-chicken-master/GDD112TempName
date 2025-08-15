extends Node2D

var start_pos = [Vector2(0,0),Vector2(200,0)]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_first_node_in_group("player1").global_position = start_pos[0]
	get_tree().get_first_node_in_group("player2").global_position = start_pos[1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
