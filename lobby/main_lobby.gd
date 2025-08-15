extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for lights in get_tree().get_nodes_in_group("player_light"):
		lights.energy = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
