extends "res://Scenes/Menu/BaseMenuPanel.gd"

signal sound_pressed
signal back_pressed

func _on_Button1_pressed() -> void:
	emit_signal("sound_pressed")

func _on_Button2_pressed() -> void:
	emit_signal("back_pressed")

