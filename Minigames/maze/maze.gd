extends Node2D

var mazeArray: Array[Array] = [] # true is collison false is no collision
const MAZE_WIDTH = 32
const MAZE_HEIGHT = 32
var mapbuilt = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.6,0.6)
		
	#Array X
	for numX in MAZE_WIDTH:
		mazeArray.append([])
		for numY in MAZE_HEIGHT:
			mazeArray[numX].append(true)
	while(!mapbuilt):
		pass
	for numX in MAZE_WIDTH:
		for numY in MAZE_HEIGHT:
			if mazeArray[numX][numY]:
				$TileMap.set_cell(0,Vector2(numX,numY),0,Vector2(0,0))
			else:
				$TileMap.set_cell(0,Vector2(numX,numY),2,Vector2(0,0))
