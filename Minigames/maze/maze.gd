extends Node2D




var maze_array: Array[Array] = [] # true is collison false is no collision
const MAZE_WIDTH = 32
const MAZE_HEIGHT = 32
var map_built = false
var tiles_attempted = 0
var player_light = preload("res://players/player_light.tscn")
var finish:Vector2
var paths_built = 0
#when the level is loaded
func _ready():
	get_tree().get_first_node_in_group("player1").global_position = $p1_spawn.global_position
	get_tree().get_first_node_in_group("player2").global_position = $p2_spawn.global_position
	#set camera zoom for players
	for camera in get_tree().get_nodes_in_group("camera"):
		camera.zoom = Vector2(0.7,0.7)
	#turn on the player lights
	for players in get_tree().get_nodes_in_group("player"):
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
		$finish_area.global_position = finish*(100*$TileMap.scale.x)
		$finish_area.global_position += Vector2((50*$TileMap.scale.x),(50*$TileMap.scale.x)) 
		while(paths_possible):
			paths_built = 0
			for num_x in MAZE_WIDTH:
				for num_y in MAZE_HEIGHT:
					if !maze_array[num_x][num_y]:
						create_path(num_x,num_y)
			print(paths_built)
			if(paths_built == 0):
				paths_possible = false
		#when no more paths can be built anymore set map built to true and end the loop
		map_built = true
	#nake the tile map the same as the array
	for num_x in MAZE_WIDTH:
		for num_y in MAZE_HEIGHT:
			if maze_array[num_x][num_y]:
				$TileMap.set_cell(0,Vector2(num_x,num_y),0,Vector2(0,0))
			else:
				$TileMap.set_cell(0,Vector2(num_x,num_y),2,Vector2(0,0))
	$TileMap.set_cell(0,finish,1,Vector2(0,0))

func create_path(x,y):
	var path_length = 0
	#while can move is true
	while(can_move(x,y) && (tiles_attempted < 1000)):
		#set moved to false
		var moved = false
		#until the path has been moved
		while ((!moved) && (tiles_attempted < 1000)):
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
								path_length += 1
				2:#down
					#boundary
					if(y+1 < MAZE_HEIGHT-1):
						if(maze_array[x][y+1] && maze_array[x][y+2]):
							#check if the tile has space
							if(tile_has_space(x,y+1,2)):
								y += 1
								moved = true
								path_length += 1
				3:#left
					#boundary
					if(x-1 > 0):
						if(maze_array[x-1][y] && maze_array[x-2][y]):
							#check if the tile has space
							if(tile_has_space(x-1,y,3)):
								x -= 1
								moved = true
								path_length += 1
				4:#right
					#boundary
					if(x+1 < MAZE_WIDTH-1):
						if(maze_array[x+1][y] && maze_array[x+2][y]):
							#check if the tile has space
							if(tile_has_space(x+1,y,4)):
								x += 1
								moved = true
								path_length += 1
		#set that tile to path
		maze_array[x][y] = false
		if(tiles_attempted < 1000):
			tiles_attempted = 0
	if(path_length > 0):
		print(path_length)
		paths_built += 1
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


func _on_finish_area_body_entered(body):
	if body == get_tree().get_first_node_in_group("player1"):
		Globals.p1_Score += 1
	if body == get_tree().get_first_node_in_group("player2"):
		Globals.p2_Score += 1
	Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())
