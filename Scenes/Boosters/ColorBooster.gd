extends Booster
class_name ColorBooster

# effects 
var destroy_effect := preload("res://Scenes/Effects/StarEffect.tscn")

func fire(_pos :Vector2 = Vector2.ZERO, _dir: Vector2 = Vector2.ZERO) -> void:
	var destroy_color: String
	var p1 = get_parent().piece_one
	var p2 = get_parent().piece_two
	if p1.is_in_group("Piece"):
		if p2.is_in_group("Piece"):
			print_debug("pas de color booster ? pick random color")
			var color_tab := ["red", "yellow", "green", "blue", "orange", "purple"]
			destroy_color = color_tab[randi() % color_tab.size()]
		else:
			destroy_color = p1.color
	else:
		if p2.is_in_group("Piece"):
			destroy_color = p2.color
		else:
			print_debug("booster mix")

	for i in Game.width:
		for j in Game.height:
			if get_parent().grid[i][j] != null:
				if get_parent().grid[i][j].is_in_group("Piece"):
					if get_parent().grid[i][j].color == destroy_color:
						get_parent().grid[i][j].matched = true
						get_parent().damage_specials(Vector2(i, j))


func destroy(_col:int, _row:int) -> void:
	fire(Vector2(_col, _row))
	queue_free()
	var _effect := destroy_effect.instance()
	_effect.position =  Game.grid_to_pixel(_col, _row)
	get_parent().add_child(_effect)
						