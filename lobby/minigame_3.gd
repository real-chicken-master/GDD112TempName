extends Area2D



func _process(_delta):
	for body in get_overlapping_bodies():
		if (body.name == "player1" || "player2"):
			var prize_number = randi_range(1,4)
			if prize_number == 1:
				$"../MeatPie".visible = true
			if prize_number == 2:
				$"../CinderBlock".visible = true
			if prize_number == 3:
					$"../PaperTrophy".visible = true
			if prize_number == 4:
					$"../Sock".visible = true

			if Globals.p1_Score > Globals.p2_Score:
				$"../P1FullWin".visible = true
			if Globals.p1_Score < Globals.p2_Score:
				$"../P2FullWin".visible = true


