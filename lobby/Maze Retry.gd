extends Button


func _on_pressed():
	Globals.change_scene(preload("res://Minigames/maze/maze.tscn").instantiate())
