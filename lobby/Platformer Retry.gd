extends Button


func _on_pressed():
	Globals.change_scene(preload("res://Minigames/platformer/platformer.tscn").instantiate())
