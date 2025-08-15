extends Node2D

var bullets = preload("res://Minigames/bullet hell/bullet.tscn")


func _ready():
	pass

func _process(_delta):
	pass


func _on_easy_timeout():
	var easytimeout = 0
	easytimeout + 1
	if easytimeout == 2:
		$Intermediate.start
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Easy.start
	print("easy mode")


func _on_intermediate_timeout():
	var intermediatetimeout = 0
	intermediatetimeout + 1
	if intermediatetimeout == 2:
		$Hard.start
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Intermediate.start
	print("intermediate mode")


func _on_hard_timeout():
	var hardtimeout = 0
	hardtimeout + 1
	if hardtimeout == 2:
		$Extreme.start
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Hard.start
	print("hard mode")


func _on_extreme_timeout():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Extreme.start
	print("extreme mode")
