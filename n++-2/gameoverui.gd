extends CanvasLayer
@export var game_over_ui: CanvasLayer
@onready var control_node = $Control
@onready var restart_button = $Control/restart
@onready var escape_timer = $Timer
@onready var countdown_label = $CountdownLabel
func ready():
	countdown_label.show()
	
func trigger_game_over():
	countdown_label.hide()
	control_node.show() 
	get_tree().paused = true
func start_escape_timer(seconds: float):
	escape_timer.start(seconds)
	
func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _process(_delta):
	if not escape_timer.is_stopped():
		countdown_label.text = "Time left: str(int(escape_timer.time_left))"

func _on_timer_timeout():
	trigger_game_over()
