extends Area2D

@onready var s_collision_shape = $"collision spike"
@onready var s_sprite = $"spikeblock sprite"
func activate_spike():
	s_sprite.show()
	s_collision_shape.set_deferred("disabled", false)
