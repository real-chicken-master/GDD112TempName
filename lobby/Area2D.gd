extends Area2D


func _process(delta):
	for body in get_overlapping_bodies():
		if (body.name == "player1" || "player2"):
			Globals.change_scene(preload("res://Minigames/maze/maze.tscn").instantiate())
