extends Node2D

var maze_array: Array[Array] = [] # true is collison false is no collision
const MAZE_WIDTH = 32
const MAZE_HEIGHT = 32
var map_built = false
var start_pos = Vector2(379,312)
var tiles_attempted = 0
var player_light = preload("res://players/player_light.tscn")
var finish:Vector2
#when the level is loaded
func _ready():
	#set camera zoom for players
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.6,0.6)
	#turn on the player lights
	for players in get_tree().get_nodes_in_group("player"):
		players.global_position = start_pos
		players.add_child(player_light.instantiate())
	#setup maze array
	for num_x in MAZE_WIDTH:
		maze_array.append([])
		for num_y in MAZE_HEIGHT:
			maze_array[num_x].append(true)
	#build maze
	while((!map_built)):
		#set the starting tile in the array
		maze_array[1][1] = false
		#this variable will be changed when no more paths are possible
		var paths_possible = true
		#build all paths
		finish = create_path(1,1)
		while(paths_possible):
			var paths_built = 0
			for num_x in MAZE_WIDTH:
				for num_y in MAZE_HEIGHT:
					if(can_make_path(num_x,num_y)):
						paths_built += 1
						create_path(num_x,num_y)
			if(paths_built == 0):
				paths_possible = false
		#whenno more paths can be built anymore set map built to true and end the loop
		map_built = true
	#nake the tile map the same as the array
	for num_x in MAZE_WIDTH:
		for num_y in MAZE_HEIGHT:
			if maze_array[num_x][num_y]:
				$TileMap.set_cell(0,Vector2(num_x,num_y),0,Vector2(0,0))
			else:
				$TileMap.set_cell(0,Vector2(num_x,num_y),2,Vector2(0,0))
	$TileMap.set_cell(0,finish,1,Vector2(0,0))

func can_make_path(x,y):
	var Return = false
	if(x > 0):
		pass
	return Return

func create_path(x,y):
	#while can move is true
	while(can_move(x,y) && (tiles_attempted < 100)):
		#set moved to false
		var moved = false
		#until the path has been moved
		while ((!moved) && (tiles_attempted < 100)):
			if(tiles_attempted > 100):
				print(tiles_attempted)
			tiles_attempted += 1
			#get a random direction
			var direction = randi_range(1,4)
			#check if the path can go that direction
			match direction:
				1:#up
					#boundary 
					if(y-1 > 0):
						if(maze_array[x][y-1] && maze_array[x][y-2]):
							#check if the tile has space
							if(tile_has_space(x,y-1,1)):
								y -= 1
								moved = true
				2:#down
					#boundary
					if(y+1 < MAZE_HEIGHT-1):
						if(maze_array[x][y+1] && maze_array[x][y+2]):
							#check if the tile has space
							if(tile_has_space(x,y+1,2)):
								y += 1
								moved = true
				3:#left
					#boundary
					if(x-1 > 0):
						if(maze_array[x-1][y] && maze_array[x-2][y]):
							#check if the tile has space
							if(tile_has_space(x-1,y,3)):
								x -= 1
								moved = true
				4:#right
					#boundary
					if(x+1 < MAZE_WIDTH-1):
						if(maze_array[x+1][y] && maze_array[x+2][y]):
							#check if the tile has space
							if(tile_has_space(x+1,y,4)):
								x += 1
								moved = true
		#set that tile to path
		maze_array[x][y] = false
		if(tiles_attempted < 100):
			tiles_attempted = 0
	return Vector2(x,y)

func can_move(x,y):
	var Return = false
	#boundary
	if(y-1 > 0):
		#check if the tile has space
		if(tile_has_space(x,y-1,1)):
			Return = true
	#boundary
	if(y+1 < MAZE_HEIGHT-1):
		#check if the tile has space
		if(tile_has_space(x,y+1,2)):
			Return = true
	#boundary
	if(x-1 > 0):
		#check if the tile has space
		if(tile_has_space(x-1,y,3)):
			Return = true
	#boundary
	if(x+1 < MAZE_WIDTH-1):
		#check if the tile has space
		if(tile_has_space(x+1,y,4)):
			Return = true
	return Return


func tile_has_space(x,y,direction):
	var Return = false
	match direction:
		1:#up
			#boundary
			if(y-1 > 0 && x+1 < MAZE_WIDTH-1 && x-1 > 0):
				if(maze_array[x][y-1] && maze_array[x-1][y] && maze_array[x+1][y]):
					Return = true
		2:#down
			#boundary
			if(y+1 < MAZE_HEIGHT-1 && x+1 < MAZE_WIDTH-1 && x-1 > 0):
				if(maze_array[x][y+1] && maze_array[x-1][y] && maze_array[x+1][y]):
					Return = true
		3:#left
			#boundary
			if(y+1 < MAZE_HEIGHT-1 && y+1 < MAZE_HEIGHT-1 && x-1 > 0):
				if(maze_array[x][y-1] && maze_array[x][y+1] && maze_array[x-1][y]):
					Return = true
		4:#right
			#boundary
			if(y+1 < MAZE_HEIGHT-1 && y+1 < MAZE_HEIGHT-1 && x+1 < MAZE_WIDTH-1):
				if(maze_array[x][y-1] && maze_array[x+1][y] && maze_array[x][y+1]):
					Return = true
	return Return



func _on_tree_exiting():
	for players in get_tree().get_nodes_in_group("player"):
		pass
		#players.remove_child()
