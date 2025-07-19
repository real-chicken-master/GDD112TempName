extends Node2D

var level = preload("res://lobby/main_lobby.tscn").instantiate():
	set(lvl):
		level.queue_free()
		level = lvl
		add_child(level)

func _ready():
	add_child(level)

