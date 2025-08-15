extends Node2D

var eadibles = preload("res://Minigames/Eating Sim/eadible.tscn")


func _ready():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var eadible = eadibles.instantiate()
	eadible.global_position = spawnpos
	$projectiles.add_child(eadible)
	

func _process(_delta):
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var eadible = eadibles.instantiate()
	eadible.global_position = spawnpos
	$projectiles.add_child(eadible)
	
