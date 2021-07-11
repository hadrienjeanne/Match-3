extends "res://Scenes/Menu/BaseMenuPanel.gd"

signal play_pressed
signal settings_pressed

func _on_Button1_pressed() -> void:
	emit_signal("play_pressed")

func _on_Button2_pressed() -> void:
	emit_signal("settings_pressed")
