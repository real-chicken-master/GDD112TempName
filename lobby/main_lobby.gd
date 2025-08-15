extends Node2D

var start_pos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		players.global_position = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
