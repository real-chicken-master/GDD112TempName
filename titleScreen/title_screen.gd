extends Control

func _process(_delta):
	$BackgroundArt.rotation_degrees += 2.5
	$ArcadeWall.rotation_degrees += 2.5
	pass

func _on_button_button_down():
	get_tree().change_scene_to_file("res://UI/splitscreen.tscn")
