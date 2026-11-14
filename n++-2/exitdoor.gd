extends Area2D
@onready var doorcollision =$"doorcollision"


func _ready():
	doorcollision.set_deferred("disabled", true)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
