extends Node2D

var mazeArray: Array[Array] = []
const MAZE_WIDTH = 32
const MAZE_HEIGHT = 18
 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.6,0.6)
		
	#Array X
	for numX in MAZE_WIDTH:
		mazeArray.append([])
		
		for numY in MAZE_HEIGHT:
			mazeArray[numX].append(true)
		
	for numX in MAZE_WIDTH:
		for numY in MAZE_HEIGHT:
			print(mazeArray[numX][numY])
