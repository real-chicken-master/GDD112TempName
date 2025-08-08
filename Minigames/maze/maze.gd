extends Node2D

var maze_array: Array[Array] = [] # true is collison false is no collision
const MAZE_WIDTH = 32
const MAZE_HEIGHT = 32
var mapbuilt = false

func _ready():
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.6,0.6)
	for numX in MAZE_WIDTH:
		maze_array.append([])
		for numY in MAZE_HEIGHT:
			maze_array[numX].append(true)
	while(!mapbuilt):
		var X = 1
		var Y = 1
		maze_array[1][1] = false
		while(canMove(X,Y)):
			var moved = false
			while (!moved):
				var direction = randi_range(1,4)
				match direction:
					1:
						if(Y-1 != 0):
							if(maze_array[X][Y-1] && maze_array[X][Y-2]):
								if(tileHasSpace(X,Y-1,direction)):
									Y -= 1
									moved = true
					2:
						if(Y+1 != MAZE_HEIGHT-1):
							if(maze_array[X][Y+1] && maze_array[X][Y+2]):
								if(tileHasSpace(X,Y+1,direction)):
									Y += 1
									moved = true
					3:
						if(X-1 != 0):
							if(maze_array[X-1][Y] && maze_array[X-2][Y]):
								if(tileHasSpace(X-1,Y,direction)):
									X -= 1
									moved = true
					4:
						if(X+1 != MAZE_WIDTH-1):
							if(maze_array[X+1][Y] && maze_array[X+2][Y]):
								if(tileHasSpace(X+1,Y,direction)):
									X += 1
									moved = true
			maze_array[X][Y] = false
		mapbuilt = true
	for numX in MAZE_WIDTH:
		for numY in MAZE_HEIGHT:
			if maze_array[numX][numY]:
				$TileMap.set_cell(0,Vector2(numX,numY),0,Vector2(0,0))
			else:
				$TileMap.set_cell(0,Vector2(numX,numY),2,Vector2(0,0))

func canMove(X,Y):
	var Return = false
	if(Y-1 != 0):
		if(maze_array[X][Y-1] && maze_array[X][Y-2]):
			Return = true
	if(Y+1 != MAZE_HEIGHT-1):
		if(maze_array[X][Y+1] && maze_array[X][Y+2]):
			Return = true
	if(X-1 != 0):
		if(maze_array[X-1][Y] && maze_array[X-2][Y]):
			Return = true
	if(X+1 != MAZE_WIDTH-1):
		if(maze_array[X+1][Y] && maze_array[X+2][Y]):
			Return = true
	return Return


func tileHasSpace(x,y,direction):
	var Return = true
	match direction:
		1:
			if(maze_array[x][y]):
				if!(maze_array[x][y-1] && maze_array[x-1][y] && maze_array[x+1][y]):
					Return = false
		2:
			if(maze_array[x][y]):
				if!(maze_array[x][y+1] && maze_array[x-1][y] && maze_array[x+1][y]):
					Return = false
		3:
			if(maze_array[x][y]):
				if!(maze_array[x][y-1] && maze_array[x][y+1] && maze_array[x-1][y]):
					Return = false
		4:
			if(maze_array[x][y]):
				if!(maze_array[x][y-1] && maze_array[x+1][y] && maze_array[x][y+1]):
					Return = false
	return Return

