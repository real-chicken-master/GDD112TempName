extends Area2D

const speed = 250
var player_array = []
var target_pos

func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		player_array.push_front(players)
	target_pos = (player_array[randi_range(0,1)].global_position)


func _process(delta):
	var direction = (target_pos - global_position).normalized()
	global_position += direction * speed * delta
	for body in get_overlapping_bodies():
		if (body.name == "res://players/player1/player1.tscn" || "res://players/player 2/player2.tscn"):
			hit()
			queue_free()


func _on_despawntimer_timeout():
	queue_free()


func hit():
	pass
