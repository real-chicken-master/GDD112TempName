extends Area2D
@onready var label = $"../Label"



#makes it so player 1 and 2 finished is set to false and when the win point body is entered it checks the player name and sets the players win bool to true. 
var player_1_finished: bool = false
var player_2_finished: bool = false
func _on_body_entered(body):
	if body.name == "player2": 
		player_2_finished = true

	if body.name == "player1":
		player_1_finished = true	

	#when player 1 and 2 finished is set to true it checks in a global who has the lower score (times hit) and gives them a point in the score.
	if player_1_finished and player_2_finished:

		if Globals.player_1_hit > Globals.player_2_hit: label.text = "p2 win!"
		if Globals.player_1_hit > Globals.player_2_hit:Globals.p2_Score += 1
		if Globals.player_2_hit > Globals.player_1_hit: label.text = "p1 win!"
		if Globals.player_2_hit > Globals.player_1_hit:Globals.p1_Score += 1
		if Globals.player_2_hit == Globals.player_1_hit: label.text = "TIE!"
		
		#sends players back to lobby after the score point is given (also resets the platformer score to 0).
		await get_tree().create_timer(2).timeout
		Globals.player_1_hit = 0
		Globals.player_2_hit = 0
		for players in get_tree().get_nodes_in_group("player"):
			players.movemode = "topdown"
		Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())
