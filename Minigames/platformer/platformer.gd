extends Node2D


#set player movement mode to platformer mode and the spawn possition in the minigame.
func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		players.movemode = "platformer"
		players.global_position = Vector2(0,0)



#each time a spike is entered by a player a point is gained, who ever gets to the end with the least points wins.
func _on_body_entered(body):
	if (body.name == "player1"):
		Globals.player_1_hit += 1
	if (body.name == "player2"):
		Globals.player_2_hit += 1





