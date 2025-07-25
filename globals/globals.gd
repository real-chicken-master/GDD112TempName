extends Node

@onready var players = get_tree().get_nodes_in_group("player")

var movemode = "topdown":
	set(mode):
		movemode = mode
		for player in players:
			player.movemode = mode

func change_scene(level):
	var levelSwitcher = get_tree().get_first_node_in_group("levelSwitcher")
	levelSwitcher.level = level
