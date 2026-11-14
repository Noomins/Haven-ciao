extends CharacterBody2D
@export var game_over_ui: CanvasLayer
@onready var s_collision_shape = $"../spike/collision spike"
@onready var s_sprite = $"../spike/spikeblock sprite"
@onready var s1_sprite = $"../spike/spikespawn"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gameover = false
func _ready():
	s1_sprite.hide()
	$"../the gem/AnimatedSprite2D".play("idle")

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
		$Sprite2D.hide()
		$playerwalk.play("walk")
		$playerwalk.animation_finished
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_junppad_body_entered(_body: CharacterBody2D) -> void:
	velocity.y = JUMP_VELOCITY *1.75
	$"../junppad/AnimatedSprite2D".play("jump")

func _on_spike_body_entered(_body: CharacterBody2D) -> void:
	game_over_ui.trigger_game_over()

func _on_spike_2_body_entered(_body: CharacterBody2D) -> void:
	game_over_ui.trigger_game_over()
