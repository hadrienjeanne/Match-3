extends Node

var gold := 0

var lives := 5 setget set_lives


func set_lives(value: int) -> void:
    lives = value
    if lives <= 0:
        print_debug("no lives")

