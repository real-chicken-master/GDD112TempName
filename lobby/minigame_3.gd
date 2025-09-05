extends Area2D




func _on_body_entered(body):
		if (body.name == "player1" || "player2"):
			var prize_number = randi_range(1,4)
			match prize_number:
				1:
					$"../MeatPie".visible = true
				2:
					$"../CinderBlock".visible = true
				3:
					$"../PaperTrophy".visible = true
				4:
					$"../Sock".visible = true

			if Globals.p1_Score > Globals.p2_Score:
				$"../P1FullWin".visible = true
			if Globals.p1_Score < Globals.p2_Score:
				$"../P2FullWin".visible = true
