extends Control

onready var turns_label: Label = $Background/MarginContainer/HBoxContainer/TurnsLabel
onready var grid := get_node("../Grid")

func _ready() -> void:
	var _err = grid.connect("piece_destroyed", self, "_on_piece_destroyed")
	_err = grid.connect("col_booster_destroyed", self, "_on_col_booster_destroyed")
	_err = grid.connect("row_booster_destroyed", self, "_on_row_booster_destroyed")
	_err = grid.connect("bomb_booster_destroyed", self, "_on_bomb_booster_destroyed")
	_err = grid.connect("color_booster_destroyed", self, "_on_bomb_booster_destroyed")
	_err = grid.connect("move_played", self, "_on_move_played")
	turns_label.text = str(grid.moves)


func _on_piece_destroyed(color: String) -> void:
	print_debug("piece destroyed: ", color)

func _on_col_booster_destroyed() -> void:
	print_debug("col booster destroyed: ")

func _on_row_booster_destroyed() -> void:
	print_debug("row booster destroyed: ")

func _on_bomb_booster_destroyed() -> void:
	print_debug("bomb destroyed: ")

func _on_color_booster_destroyed() -> void:
	print_debug("color booster destroyed: ")

func _on_move_played(value: int) -> void:
	turns_label.text = str(value)
