extends Booster
class_name BombBooster

# effects 
var destroy_effect := preload("res://Scenes/Effects/StarEffect.tscn")

func fire(_pos :Vector2 = Vector2.ZERO, _dir: Vector2 = Vector2.ZERO) -> void:
	
	for i in [_pos.x, _pos.x-1, _pos.x+1]:
		for j in [_pos.y, _pos.y-1, _pos.y+1]:
			if Game.is_in_grid(Vector2(i, j)):
				if get_parent().grid[i][j] != null:
					get_parent().grid[i][j].matched = true
			get_parent().damage_specials(Vector2(i, j))


func destroy(_col:int, _row:int) -> void:
	fire(Vector2(_col, _row))
	queue_free()
	var _effect := destroy_effect.instance()
	_effect.position =  Game.grid_to_pixel(_col, _row)
	get_parent().add_child(_effect)