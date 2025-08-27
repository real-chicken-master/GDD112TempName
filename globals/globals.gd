extends Node

var p1_Score = 0:
	set(temp):
		p1_Score = temp
		print(temp)

var p2_Score = 0

var player_1_hit:int = 0:
	set(timesHit):
		player_1_hit = timesHit
		get_tree().get_first_node_in_group("p1hitcounter").text = str(timesHit)

var player_2_hit:int = 0:
	set(timesHit2):
		player_2_hit = timesHit2
		get_tree().get_first_node_in_group("p2hitcounter").text = str(timesHit2)

@onready var players = get_tree().get_nodes_in_group("player")


var movemode = "topdown":
	set(mode):
		movemode = mode
		for player in players:
			player.movemode = mode

var hit_counter = 0

func change_scene(level):
	var levelSwitcher = get_tree().get_first_node_in_group("levelSwitcher")
	levelSwitcher.level = level
