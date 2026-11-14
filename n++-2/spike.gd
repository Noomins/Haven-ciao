extends Area2D
@export var game_over_ui: CanvasLayer

func _ready():
	body_entered.connect(_on_body_entered)
