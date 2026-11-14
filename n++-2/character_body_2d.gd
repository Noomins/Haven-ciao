extends CharacterBody2D
@export var game_over_ui: CanvasLayer
@onready var countdown_label = $CountdownLabel
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gameover = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jumping") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("walk left", "walk right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _on_spike_body_entered(body: CharacterBody2D) -> void:
	if game_over_ui :
		game_over_ui.trigger_game_over()

func _on_junppad_body_entered(body: CharacterBody2D) -> void:
	velocity.y = JUMP_VELOCITY *1.5
	
