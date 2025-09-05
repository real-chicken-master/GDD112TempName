extends Area2D
@onready var player_1 = get_tree().get_first_node_in_group("player1")
@onready var player_2 = get_tree().get_first_node_in_group("player2")
var player_win

func _on_body_entered(body):
	if !Globals.end_triggered && (Globals.p1_Score > 0 || Globals.p2_Score > 0):
		Globals.end_triggered = true
		if Globals.p1_Score > Globals.p2_Score:
			player_win = player_1
		if Globals.p1_Score < Globals.p2_Score:
			player_win = player_2
		if (body.name == "player1" || "player2"):
			var prize_number = randi_range(1,4)
			match prize_number:
				1:
					$"../MeatPie".visible = true
					$"../MeatPie".global_position = player_win.global_position
				2:
					$"../CinderBlock".visible = true
					$"../CinderBlock".global_position = player_win.global_position
				3:
					$"../PaperTrophy".visible = true
					$"../PaperTrophy".global_position = player_win.global_position
				4:
					$"../Sock".visible = true
					$"../Sock".global_position = player_win.global_position

			if Globals.p1_Score > Globals.p2_Score:
				$"../P1FullWin".visible = true
				$"../P1FullWin".global_position = player_win.global_position
			
			if Globals.p1_Score < Globals.p2_Score:
				$"../P2FullWin".visible = true
				$"../P2FullWin".global_position = player_win.global_position
		
