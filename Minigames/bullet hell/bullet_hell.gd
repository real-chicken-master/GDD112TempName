extends Node2D

var can_shoot = true
var health = 3
const bullet = preload("res://Minigames/bullet hell/bullet.tscn")

func _ready():
	pass


func _process(delta):
	if health >= 0:
		Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())
