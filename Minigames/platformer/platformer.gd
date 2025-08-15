extends Node2D

var hitcounter = 0

func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		players.movemode = "platformer"
		players.global_position = Vector2(0,0)


func _process(_delta):
	pass

#each time a spike is entered by a player a point is gained, who ever gets to the end with the least points wins.
func _on_body_entered(body):
	if (body.name == "player1hit"):
		Globals.player1hit += 1
	if (body.name == "player2hit"):
		Globals.player2hit += 1





