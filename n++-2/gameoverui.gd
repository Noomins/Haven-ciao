extends CanvasLayer
@export var game_over_ui: CanvasLayer
@onready var control_node = $Control
@onready var restart_button = $Control/restart
@onready var escape_timer = $Timer
@onready var s_collision_shape = $collisionspike
@onready var s_sprite = $spikesprite
@onready var g_collision_shape = $"../the gem/gem collision"
@onready var g_sprite = $"../the gem/gem sprite"
func trigger_game_over():
	control_node.show() 
	get_tree().paused = true
func start_escape_timer(seconds: float):
	escape_timer.start(seconds)
	
func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_timer_timeout():
	trigger_game_over()

func _on_the_gem_body_entered(body: CharacterBody2D) -> void:
	start_escape_timer(10.0)
	get_tree().call_group("spikes", "activate_spike")
	$"../spike/spikespawn".play("spawn")
	g_sprite.hide()
	g_collision_shape.set_deferred("disabled", true)
	
	
