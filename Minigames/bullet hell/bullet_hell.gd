extends Node2D

var bullets = preload("res://Minigames/bullet hell/bullet.tscn")
var easytimeout = 0
var intermediatetimeout = 0
var hardtimeout = 0


func _ready():
	pass

func _process(_delta):
	pass


func _on_easy_timeout():
	easytimeout += 1
	if easytimeout == 30:
		$Intermediate.start()
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Easy.start


func _on_intermediate_timeout():
	intermediatetimeout += 1
	if intermediatetimeout == 120:
		$Hard.start()
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Intermediate.start


func _on_hard_timeout():
	hardtimeout += 1
	if hardtimeout == 220:
		$Extreme.start()
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Hard.start


func _on_extreme_timeout():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Extreme.start
