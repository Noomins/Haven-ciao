extends CanvasLayer
@export var game_over_ui: CanvasLayer
@onready var control_node = $Control
@onready var restart_button = $Control/restart
@onready var escape_timer = $Timer
@onready var s_collision_shape = $"../spike/collision spike"
@onready var s_sprite = $"../spike/spikeblock sprite"
@onready var g_collision_shape = $"../the gem/gem collision"
@onready var g_sprite = $"../the gem/AnimatedSprite2D"
@onready var countdown_label = $CountdownLabel
@onready var doorclosed =$"../exitdoor/doorclosed"
@onready var doorcollision=$"../exitdoor/doorcollision"
@onready var rocketshoot=$"../rocketbox/rocketshoot"
func trigger_game_over():
	control_node.show() 
	get_tree().paused = true

func trigger_win() -> void:
	escape_timer.stop()
	control_node.show()
	$Control/gameovertext.text = "gem licked............"
	get_tree().paused = true

func start_escape_timer(seconds: float):
	escape_timer.start(seconds)
	
func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_timer_timeout():
	trigger_game_over()

func _on_the_gem_body_entered(_body: CharacterBody2D) -> void:
	start_escape_timer(10.0)
	get_tree().call_group("spikes", "activate_spike")
	$"../spike/spikespawn".play("spawn")
	$"../rocketbox/rocketshoot".play("shoot")
	g_sprite.hide()
	g_collision_shape.set_deferred("disabled", true)
	doorcollision.set_deferred("disabled",false)
	doorclosed.hide()
func _process(_delta: float) -> void:
	if not escape_timer.is_stopped():
		countdown_label.text = "%.1f" % escape_timer.time_left



func _on_exitdoor_body_entered(_body: CharacterBody2D) -> void:
	trigger_win()
