extends Node2D

var bullets = 


func _ready():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	print(spawnpos)


func _process(_delta):
	pass
