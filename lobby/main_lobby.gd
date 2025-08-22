extends Node2D
@onready var p1_Text = get_tree().get_first_node_in_group("p1hitcounter")
@onready var p2_Text = get_tree().get_first_node_in_group("p2hitcounter")
var start_pos = [Vector2(0,0),Vector2(200,0)]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_first_node_in_group("player1").global_position = start_pos[0]
	get_tree().get_first_node_in_group("player2").global_position = start_pos[1]
	for player_lights in get_tree().get_nodes_in_group("player_light"):
		player_lights.queue_free()
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(1,1)
	p1_Text.text = "P1 score: " + str(Globals.p1_Score)
	p2_Text.text = "P2 score: " + str(Globals.p2_Score)
