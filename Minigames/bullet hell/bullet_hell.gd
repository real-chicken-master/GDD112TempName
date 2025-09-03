extends Node2D

var bullets = preload("res://Minigames/bullet hell/bullet.tscn")
var easytimeout = 0
var intermediatetimeout = 0
var hardtimeout = 0


func _ready():
	get_tree().get_first_node_in_group("player1").global_position = $"PlayerSpawns/p1 spawn".global_position
	get_tree().get_first_node_in_group("player2").global_position = $"PlayerSpawns/p2 spawn".global_position

func _process(_delta):
	pass


func _on_easy_timeout():
	easytimeout += 1
	if easytimeout == 20:
		$Intermediate.start()
	spawn_bullet()
	$Easy.start
#easy mode bullet spawning

func _on_intermediate_timeout():
	intermediatetimeout += 1
	if intermediatetimeout == 100:
		$Hard.start()
	spawn_bullet()
	$Intermediate.start
#intermediate mode bullet spawning

func _on_hard_timeout():
	hardtimeout += 1
	if hardtimeout == 220:
		$Extreme.start()
	
	$Hard.start
#hard mode bullet spawning

func _on_extreme_timeout():
	spawn_bullet()
	$Extreme.start
#extreme mode bullet spawning

func spawn_bullet():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	bullet.connect("end_game",end_game)

func end_game():
	await get_tree().create_timer(3).timeout
	Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())

