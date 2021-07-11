extends Control

onready var main_menu := $MainMenu
onready var settings_menu := $SettingsMenu
var level_select_scene := preload("res://Scenes/GameWindow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu.slide_in()

func _on_MainMenu_play_pressed() -> void:
	var _err := get_tree().change_scene_to(level_select_scene)

func _on_MainMenu_settings_pressed() -> void:
	main_menu.slide_out()
	settings_menu.slide_in()

func _on_SettingsMenu_sound_pressed() -> void:
	print_debug("sound changed")

func _on_SettingsMenu_back_pressed() -> void:
	settings_menu.slide_out()
	main_menu.slide_in()
