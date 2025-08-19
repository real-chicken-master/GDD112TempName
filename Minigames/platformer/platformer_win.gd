extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var player_1_finished: bool = false
var player_2_finished: bool = false
func _on_body_entered(body):
	if body.name == "player2": 
		player_2_finished = true
	if body.name == "player1":
		player_1_finished = true
	
	if player_1_finished and player_2_finished:
		if Globals.player_1_hit >= Globals.player_2_hit: print("player2win!")
		if Globals.player_2_hit <= Globals.player_1_hit: print("player1win!")
