extends Node2D

var mazeArray: Array[Vector2]
# Called when the node enters the scene tree for the first time.
func _ready():
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.6,0.6)
	for num in 32:
		for num2 in 18:
			mazeArray.push_back(Vector2(num,num2))
	for num in mazeArray.size():
		$TileMap.set_cell(0,mazeArray[num],0,Vector2i(0, 0))
	
