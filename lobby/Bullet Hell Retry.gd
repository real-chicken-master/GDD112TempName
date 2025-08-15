extends Button


func _on_pressed():
	Globals.change_scene(preload("res://Minigames/bullet hell/bullet_hell.tscn").instantiate())


func _on_platformer_retry_pressed():
	pass # Replace with function body.
