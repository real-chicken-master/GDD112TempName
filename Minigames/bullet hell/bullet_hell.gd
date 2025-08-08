extends Node2D

var bullets = preload("res://Minigames/bullet hell/bullet.tscn")


func _ready():
	var spawnpos = $"Bullet Spawns".get_child(randi()%$"Bullet Spawns".get_child_count()).global_position
	var bullet = bullets.instantiate()
	bullet.global_position = spawnpos
	$projectiles.add_child(bullet)
	print(bullet)

func _process(_delta):
	pass
