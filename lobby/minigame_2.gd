extends Area2D



func _ready():
	for body in get_overlapping_bodies():
		if (body.name == "player1" || "player2"):
			pass
			



