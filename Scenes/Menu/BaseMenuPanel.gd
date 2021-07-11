extends CanvasLayer

onready var anim_player: AnimationPlayer = $AnimationPlayer

func slide_in() -> void:
	anim_player.play("slide_in")
	
func slide_out() -> void:
	anim_player.play_backwards("slide_in")
