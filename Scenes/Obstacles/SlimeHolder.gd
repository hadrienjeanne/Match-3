extends "res://Scenes/Obstacles/ObstacleHolder.gd"

var slime_damaged_during_turn := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func generate_slime() -> void:
	var slimes_list := obstacle_pieces.duplicate(false)
	var normal_neighbour := Vector2(-1, -1)

	while slimes_list.size() > 0:
		var idx = Game.rng.randi_range(0, slimes_list.size()-1)
		var slime_coord = slimes_list[idx]
		slimes_list.remove(idx)
		normal_neighbour = get_parent().find_normal_neighbour(slime_coord.x, slime_coord.y)
		
		if normal_neighbour != Vector2(-1, -1):
			# suppression of the newly slimmed piece
			var piece = get_parent().grid[normal_neighbour.x][normal_neighbour.y]
			piece.queue_free()
			get_parent().grid[normal_neighbour.x][normal_neighbour.y] = null

			obstacle_pieces.append(normal_neighbour)
			var new_slime := obstacle_scene.instance()
			add_child(new_slime)
			new_slime.position = Vector2(Game.x_start + normal_neighbour.x * Game.offset, Game.y_start + normal_neighbour.y * -Game.offset)
			obstacle_grid[normal_neighbour.x][normal_neighbour.y] = new_slime
			var _err = new_slime.connect("obstacle_destroyed", self, "_on_obstacle_destroyed")
			return
	