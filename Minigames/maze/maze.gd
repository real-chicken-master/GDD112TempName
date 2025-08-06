extends Node2D

var mazeArray: Array[Array] = [] # true is collison false is no collision
const MAZE_WIDTH = 32
const MAZE_HEIGHT = 32
var mapbuilt = false

func _ready():
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.6,0.6)
	for numX in MAZE_WIDTH:
		mazeArray.append([])
		for numY in MAZE_HEIGHT:
			mazeArray[numX].append(true)
	while(!mapbuilt):
		var X = 1
		var Y = 1
		mazeArray[1][1] = false
		while(canMove(X,Y)):
			var moved = false
			while (!moved):
				var direction = randi_range(1,4)
				match direction:
					1:
						if(Y-1 != 0):
							if(mazeArray[X][Y-1] == true && mazeArray[X][Y-2]):
								Y -= 1
								moved = true
					2:
						if(Y+1 != MAZE_HEIGHT-1):
							if(mazeArray[X][Y+1] == true && mazeArray[X][Y+2]):
								Y += 1
								moved = true
					3:
						if(X-1 != 0):
							if(mazeArray[X-1][Y] == true && mazeArray[X-2][Y]):
								X -= 1
								moved = true
					4:
						if(X+1 != MAZE_WIDTH-1):
							if(mazeArray[X+1][Y] == true && mazeArray[X+2][Y]):
								X += 1
								moved = true
			mazeArray[X][Y] = false
		mapbuilt = true
	for numX in MAZE_WIDTH:
		for numY in MAZE_HEIGHT:
			if mazeArray[numX][numY]:
				$TileMap.set_cell(0,Vector2(numX,numY),0,Vector2(0,0))
			else:
				$TileMap.set_cell(0,Vector2(numX,numY),2,Vector2(0,0))

func canMove(X,Y):
	var Return = false
	if(Y-1 != 0):
		if(mazeArray[X][Y-1] == true && mazeArray[X][Y-2]):
			Return = true
	if(Y+1 != MAZE_HEIGHT-1):
		if(mazeArray[X][Y+1] == true && mazeArray[X][Y+2]):
			Return = true
	if(X-1 != 0):
		if(mazeArray[X-1][Y] == true && mazeArray[X-2][Y]):
			Return = true
	if(X+1 != MAZE_WIDTH-1):
		if(mazeArray[X+1][Y] == true && mazeArray[X+2][Y]):
			Return = true
	return Return
