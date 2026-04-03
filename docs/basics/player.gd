@tool
extends RigidBody3D

@export var speed: float = 50.0
@export var jump_impulse: float = 5.0

func _physics_process(_delta: float) -> void:
	# 1. Handle Continuous Movement
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Note: In 3D, 'up' on a 2D vector usually maps to negative Z (forward)
	var force = Vector3(direction.x, 0, direction.y) * speed
	
	# apply_central_force should be called in _physics_process for smooth motion
	apply_central_force(force)

	
func _input(event: InputEvent) -> void:
	# 2. Handle Discrete Actions (Jumping)
	if event.is_action_pressed("jump"):
		# Using a smaller impulse or checking if grounded is usually best
		apply_central_impulse(Vector3.UP * jump_impulse)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
