extends Area2D
@export var game_over_ui: CanvasLayer

func _on_the_gem_body_entered(body: CharacterBody2D) -> void:
	if game_over_ui:
		game_over_ui.start_escape_timer(1.0)
