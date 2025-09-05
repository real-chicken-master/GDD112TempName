extends Control

var rotate =  randf_range(-1,1)
var button_Rotate = randf_range(-1,1)
func _process(_delta):
	$BackgroundArt.rotation_degrees += rotate
	$ArcadeWall.rotation_degrees -= rotate
	$Button.rotation_degrees += button_Rotate

func _on_button_button_down():
	get_tree().change_scene_to_file("res://UI/splitscreen.tscn")


func _on_timer_timeout():
	rotate =  randf_range(-1,1)
	button_Rotate = randf_range(-1,1)
	$Timer.start()
