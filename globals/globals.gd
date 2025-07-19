extends Node


func change_scene(level):
	var levelSwitcher = get_tree().get_first_node_in_group("levelSwitcher")
	levelSwitcher.level = level
