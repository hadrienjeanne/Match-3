extends Node2D

signal obstacle_destroyed

export (int) var health := 1 setget take_damage

func take_damage(damage: int) -> void:
	health = damage
	if health <= 0:
		emit_signal("obstacle_destroyed", Game.pixel_to_grid(position.x, position.y))
		queue_free()