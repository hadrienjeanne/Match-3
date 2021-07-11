extends Node

# grid variables
export (int) var width := 8
export (int) var height := 10
export (int) var x_start := 64
export (int) var y_start := 800
export (int) var offset := 64
export (int) var spawn_offset := 2

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

##
##  Helpers functions
##

# input: a column and a row number for a piece
# output: the position in pixels of the piece
func grid_to_pixel(column: int, row: int) -> Vector2:
	var new_x := x_start + offset * column
	var new_y := y_start + -offset * row
	return Vector2(new_x, new_y)

# input: a position in pixels of the mouse 
# output: the column and the row number for the piece
func pixel_to_grid(x: float, y: float) -> Vector2:
	var col := round((x - x_start) / float(offset))
	var row := round((y - y_start) / float(-offset))
	return Vector2(col, row)

# tells whether the position pos is inside the grid 
func is_in_grid(pos: Vector2) -> bool:
	return pos.x >= 0 and pos.y >= 0 and pos.x < width and pos.y < height

# tells whether an item is in an array
func is_in_array(array: Array, item) -> bool:
	for i in array.size():
		if array[i] == item:
			return true
	return false

# create a 2D array of size (w, h)
func make_2d_array(w: int, h: int) -> Array:
	var array := []
	for i in range(w):
		array.append([])
		for _j in range(h):
			array[i].append(null)
	return array
