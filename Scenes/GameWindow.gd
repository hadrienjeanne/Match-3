extends Node2D

onready var grid := $Grid
onready var game_over_panel := $GameOverPanel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _err := grid.connect("game_over", self, "_on_game_over")


func _on_game_over() -> void:
	game_over_panel.slide_in()