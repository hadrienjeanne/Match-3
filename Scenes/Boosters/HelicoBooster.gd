extends Booster

# effects 
var destroy_effect := preload("res://Scenes/Effects/StarEffect.tscn")

func fire(_pos :Vector2 = Vector2.ZERO, _dir: Vector2 = Vector2.ZERO) -> void:
	
	var _col = _pos.x #+ _dir.x
	print_debug("fire helico booster:", _col)

func destroy(_col:int, _row:int) -> void:
	queue_free()
	var _effect := destroy_effect.instance()
	_effect.position =  Game.grid_to_pixel(_col, _row)
	get_parent().add_child(_effect)
