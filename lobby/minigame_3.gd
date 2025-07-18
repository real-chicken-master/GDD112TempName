extends Area2D



func _process(_delta):
	for body in get_overlapping_bodies():
		if (body.name == "player1" || "player2"):
			get_tree().change_scene_to_file("res://Minigames/road_brawl.tscn")
