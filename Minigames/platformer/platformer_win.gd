extends Area2D
@onready var label = $"../Label"




var player_1_finished: bool = false
var player_2_finished: bool = false
func _on_body_entered(body):
	if body.name == "player2": 
		player_2_finished = true
		print ("player 2 enter")
	
	if body.name == "player1":
		player_1_finished = true
		print ("player 1 enter")
	print (body)
	if player_1_finished and player_2_finished:
		print (Globals.player_1_hit)
		print (Globals.player_2_hit)
		if Globals.player_1_hit > Globals.player_2_hit: label.text = "p2 win!"
		if Globals.player_1_hit > Globals.player_2_hit:Globals.p2_Score += 1
		if Globals.player_2_hit > Globals.player_1_hit: label.text = "p1 win!"
		if Globals.player_2_hit > Globals.player_1_hit:Globals.p1_Score += 1
		if Globals.player_2_hit == Globals.player_1_hit: label.text = "TIE!"
		
		await get_tree().create_timer(2).timeout
		Globals.player_1_hit = 0
		Globals.player_2_hit = 0
		for players in get_tree().get_nodes_in_group("player"):
			players.movemode = "topdown"
		Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())
