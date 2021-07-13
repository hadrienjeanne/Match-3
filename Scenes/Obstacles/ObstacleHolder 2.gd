extends Node2D


export (PoolVector2Array) var obstacle_pieces := []
export (PackedScene) var obstacle_scene: PackedScene
export (bool) var moveable := true
export (bool) var damaged_on_side_matches := false

var obstacle_grid := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	obstacle_grid = Game.make_2d_array(Game.width, Game.height)
	spawn_obstacle()


# damages the obstacle at the position pos, returns true if the damage is done
func damage(pos) -> bool:
	var damaged := false
	if !damaged_on_side_matches:
		if obstacle_grid[pos.x][pos.y] != null:
			obstacle_grid[pos.x][pos.y].health -= 1
			if obstacle_grid[pos.x][pos.y].health <= 0:
				obstacle_grid[pos.x][pos.y] = null		
			damaged = true	
	else: # damaged on side matches like concrete
			# check if concrete on sides of damaged piece
		if pos.x < Game.width - 1:
			if obstacle_grid[pos.x + 1][pos.y] != null:
				obstacle_grid[pos.x + 1][pos.y].health -= 1
				if obstacle_grid[pos.x + 1][pos.y].health <= 0:
					obstacle_grid[pos.x + 1][pos.y] = null
				damaged = true
		if pos.x > 0:
			if obstacle_grid[pos.x - 1][pos.y] != null:
				obstacle_grid[pos.x - 1][pos.y].health -= 1
				if obstacle_grid[pos.x - 1][pos.y].health <= 0:
					obstacle_grid[pos.x - 1][pos.y] = null
				damaged = true
		if pos.y < Game.height - 1:
			if obstacle_grid[pos.x][pos.y + 1] != null:
				obstacle_grid[pos.x][pos.y + 1].health -= 1
				if obstacle_grid[pos.x][pos.y + 1].health <= 0:
					obstacle_grid[pos.x][pos.y + 1] = null
				damaged = true
		if pos.y > 0:
			if obstacle_grid[pos.x][pos.y - 1] != null:
				obstacle_grid[pos.x][pos.y - 1].health -= 1
				if obstacle_grid[pos.x][pos.y - 1].health <= 0:
					obstacle_grid[pos.x][pos.y - 1] = null
				damaged = true
	return damaged


func spawn_obstacle() -> void:
	for obstacle_pos in obstacle_pieces:
		var new_obstacle := obstacle_scene.instance()
		add_child(new_obstacle)
		new_obstacle.position = Vector2(Game.x_start + obstacle_pos.x * Game.offset, Game.y_start + obstacle_pos.y * -Game.offset)
		obstacle_grid[obstacle_pos.x][obstacle_pos.y] = new_obstacle
		var _err = new_obstacle.connect("obstacle_destroyed", self, "_on_obstacle_destroyed")
			
func _on_obstacle_destroyed(pos: Vector2) -> void:
	obstacle_pieces.erase(pos)
