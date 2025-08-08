extends Node2D


func _ready():
	for players in get_tree().get_nodes_in_group("player"):
		players.movemode = "platformer"
		players.global_position = Vector2(0,0)


func _process(_delta):
	pass


func _on_body_entered(body):
	print (body)
