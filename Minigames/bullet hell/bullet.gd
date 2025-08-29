extends Area2D

const speed = 250
var player_array = [] # putting the players into an array so that they can be randomly picked to target
var direction

@onready var p1 = get_tree().get_first_node_in_group("player1")
@onready var p2 = get_tree().get_first_node_in_group("player2")

func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		player_array.push_front(players)
	var target_pos = (player_array[randi_range(0,1)].global_position)
	direction = (target_pos - global_position).normalized()
# selecting a player to go towards and setting the target direction to move in

func _process(delta):
	global_position += direction * speed * delta


func _on_despawntimer_timeout():
	queue_free()


func hit():
	Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())
# when bullet hits a player, it will bring them to the main lobby

# checking if its the players that made contact with the bullets and giving points to whoever didnt hit the bullet and the movement code toward the player chosen.
func _on_body_entered(body):
	if (body == p1 or body == p2):
		if (body == p1):
			Globals.p2_Score += 1
		if (body == p2):
			Globals.p1_Score += 1
		hit()
	queue_free()
