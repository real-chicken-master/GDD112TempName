extends Node2D

#this comment is to state that all the commented out lines are so they are commented out

#this comment is becasue i dont like comments

var maze_array: Array[Array] = [] # true is collison false is no collision
# the width of the maze
const MAZE_WIDTH = 32
#the height of the maze 
const MAZE_HEIGHT = 32
#is the map built
var map_built = false
#how many tiles 
var tiles_attempted = 0
#the light for the players
var player_light = preload("res://players/player_light.tscn")
#this is the location of the finish
var finish:Vector2
#how many paths have been built
var paths_built = 0
#when the level is loaded
func _ready():
	#set the players spawn position
	#player 1
	get_tree().get_first_node_in_group("player1").global_position = $P1Spawn.global_position
	#player 2
	get_tree().get_first_node_in_group("player2").global_position = $P2Spawn.global_position
	#set camera zoom for players
	#get the cameras
	for camera in get_tree().get_nodes_in_group("camera"):
		#zoom in
		camera.zoom = Vector2(0.7,0.7)
	#turn on the player lights
	#get the players
	for players in get_tree().get_nodes_in_group("player"):
		#add the light to the players
		players.add_child(player_light.instantiate())
	#setup maze array
	#for maze width
	for num_x in MAZE_WIDTH:
		#add the arrays to the arrays
		maze_array.append([])
		#for maze height
		for num_y in MAZE_HEIGHT:
			#set all the tiles in the array to false
			maze_array[num_x].append(true)
	#build maze
	while((!map_built)):
		#set the starting tile in the array
		maze_array[1][1] = false
		#this variable will be changed when no more paths are possible
		var paths_possible = true
		#build all paths
		#get the location of the end of the path
		finish = create_path(1,1)
		#move the finish area
		#move to the positon
		$FinishArea.global_position = finish*(100*$TileMap.scale.x)
		#fix the offset
		$FinishArea.global_position += Vector2((50*$TileMap.scale.x),(50*$TileMap.scale.x)) 
		#repeat until no paths are possible
		while(paths_possible):
			#set paths built to 0
			paths_built = 0
			#for the maze width
			for num_x in MAZE_WIDTH:
				#for the maze height
				for num_y in MAZE_HEIGHT:
					#for every path block
					if !maze_array[num_x][num_y]:
						#try create a path off it
						create_path(num_x,num_y)
			#if no paths paths are built
			if(paths_built == 0):
				#end the loop
				paths_possible = false
		#when no more paths can be built anymore set map built to true and end the loop
		map_built = true
	#add tiles to the tilemap
	#for the maze width
	for num_x in MAZE_WIDTH:
		#for the maze height
		for num_y in MAZE_HEIGHT:
			#if the array is true
			if maze_array[num_x][num_y]:
				#set the tile to wall
				$TileMap.set_cell(0,Vector2(num_x,num_y),0,Vector2(0,0))
			#if the tile is false
			else:
				#set the tile to path
				$TileMap.set_cell(0,Vector2(num_x,num_y),2,Vector2(0,0))
	#set the finish tile
	$TileMap.set_cell(0,finish,1,Vector2(0,0))

func create_path(x,y):
	#reset the path length
	var path_length = 0
	#while can move is true
	while(can_move(x,y) && (tiles_attempted < 1000)):
		#set moved to false
		var moved = false
		#until the path has been moved
		while ((!moved) && (tiles_attempted < 1000)):
			#increase tiles atempted by one
			tiles_attempted += 1
			#get a random direction
			var direction = randi_range(1,4)
			#check if the path can go that direction
			match direction:
				1:#up
					#boundary 
					if(y-1 > 0):
						#
						if(maze_array[x][y-1] && maze_array[x][y-2]):
							#check if the tile has space
							if(tile_has_space(x,y-1,1)):
								#move up by 1
								y -= 1
								#set moved to true and stop the loop
								moved = true
								#increase the path length
								path_length += 1
				2:#down
					#boundary
					if(y+1 < MAZE_HEIGHT-1):
						if(maze_array[x][y+1] && maze_array[x][y+2]):
							#check if the tile has space
							if(tile_has_space(x,y+1,2)):
								#move down by 1
								y += 1
								#set moved to true and stop the loop
								moved = true
								#increase the path length
								path_length += 1
				3:#left
					#boundary
					if(x-1 > 0):
						if(maze_array[x-1][y] && maze_array[x-2][y]):
							#check if the tile has space
							if(tile_has_space(x-1,y,3)):
								#move left by 1
								x -= 1
								#set moved to true and stop the loop
								moved = true
								#increase the path length
								path_length += 1
				4:#right
					#boundary
					if(x+1 < MAZE_WIDTH-1):
						if(maze_array[x+1][y] && maze_array[x+2][y]):
							#check if the tile has space
							if(tile_has_space(x+1,y,4)):
								#move right by 1
								x += 1
								#set moved to true and stop the loop
								moved = true
								#increase the path length
								path_length += 1
		#set that tile to path
		maze_array[x][y] = false
		#make sure the loop doesnt run forever
		if(tiles_attempted < 1000):
			#reset tiles atempted
			tiles_attempted = 0
	#stop building the path if no tiles were placed
	if(path_length > 0):
		#in crease the number of paths built
		paths_built += 1
	#return the end position
	return Vector2(x,y)

#check if the tile can move
func can_move(x,y):
	#set return to false
	var Return = false
	#boundary
	if(y-1 > 0):
		#check if the tile has space
		if(tile_has_space(x,y-1,1)):
			#set return to true
			Return = true
	#boundary
	if(y+1 < MAZE_HEIGHT-1):
		#check if the tile has space
		if(tile_has_space(x,y+1,2)):
			#set return to true
			Return = true
	#boundary
	if(x-1 > 0):
		#check if the tile has space
		if(tile_has_space(x-1,y,3)):
			#set return to true
			Return = true
	#boundary
	if(x+1 < MAZE_WIDTH-1):
		#check if the tile has space
		if(tile_has_space(x+1,y,4)):
			#set return to true
			Return = true
	#returns Return
	return Return

#check if a tile has space around it
func tile_has_space(x,y,direction):
	#set return to false
	var Return = false
	match direction:
		1:#up
			#boundary
			if(y-1 > 0 && x+1 < MAZE_WIDTH-1 && x-1 > 0):
				#if all tiles around are free
				if(maze_array[x][y-1] && maze_array[x-1][y] && maze_array[x+1][y]):
					#set return to true
					Return = true
		2:#down
			#boundary
			if(y+1 < MAZE_HEIGHT-1 && x+1 < MAZE_WIDTH-1 && x-1 > 0):
				#if all tiles around are free
				if(maze_array[x][y+1] && maze_array[x-1][y] && maze_array[x+1][y]):
					#set return to true
					Return = true
		3:#left
			#boundary
			if(y+1 < MAZE_HEIGHT-1 && y+1 < MAZE_HEIGHT-1 && x-1 > 0):
				#if all tiles around are free
				if(maze_array[x][y-1] && maze_array[x][y+1] && maze_array[x-1][y]):
					#set return to true
					Return = true
		4:#right
			#boundary
			if(y+1 < MAZE_HEIGHT-1 && y+1 < MAZE_HEIGHT-1 && x+1 < MAZE_WIDTH-1):
				#if all tiles around are free
				if(maze_array[x][y-1] && maze_array[x+1][y] && maze_array[x][y+1]):
					#set return to true
					Return = true
	#returns Return
	return Return

#when a body enters the finish area
func _on_finish_area_body_entered(body):
	#if the body is p1
	if body == get_tree().get_first_node_in_group("player1"):
		#increase player ones global score
		Globals.p1_Score += 1
	#if the body is p2
	if body == get_tree().get_first_node_in_group("player2"):
		#increase player twos global score
		Globals.p2_Score += 1
	#change the scene to the main loby
	Globals.change_scene(preload("res://lobby/main_lobby.tscn").instantiate())
