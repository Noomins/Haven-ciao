extends Area2D
@export var game_over_ui: CanvasLayer
@onready var s_collision_shape = $"collision spike"
@onready var s_sprite = $"spikeblock sprite"
@onready var s1_sprite = $spikespawn

func _ready():
	add_to_group("spikes")
	s_collision_shape.set_deferred("disabled", true)
	s1_sprite.hide()



func activate_spike():
	s1_sprite.show()
	s_collision_shape.set_deferred("disabled", false)
	s1_sprite.play("spawn")
