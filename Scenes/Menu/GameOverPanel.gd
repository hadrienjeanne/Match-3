extends CanvasLayer

onready var anim_player: AnimationPlayer = $AnimationPlayer
var level_select_scene := load("res://Scenes/Menu/GameMenu.tscn")

func slide_in() -> void:
	anim_player.play("slide_in")
	
func slide_out() -> void:
	anim_player.play_backwards("slide_in")

func _on_QuitButton_pressed() -> void:
	var _err := get_tree().change_scene_to(level_select_scene)

func _on_RestartButton_pressed() -> void:
	Player.lives -= 1
	slide_out()
	yield(anim_player, "animation_finished")
	var _err := get_tree().reload_current_scene()
