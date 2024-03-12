extends Area2D

@onready var game_points = $"../game_points"

func _on_body_exited(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		game_points.add_point()
