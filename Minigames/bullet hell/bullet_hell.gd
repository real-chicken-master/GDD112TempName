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
	if easytimeout == 20:
		$Intermediate.start()
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	#$Easy.start
	print("easy mode" + str(easytimeout))


func _on_intermediate_timeout():
	intermediatetimeout += 1
	if intermediatetimeout == 80:
		$Hard.start()
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	#$Intermediate.start
	print("intermediate mode" + str(intermediatetimeout))


func _on_hard_timeout():
	hardtimeout += 1
	if hardtimeout == 150:
		$Extreme.start()
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	#$Hard.start
	print("hard mode" + str(hardtimeout))


func _on_extreme_timeout():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	$Extreme.start
	print("extreme mode")
