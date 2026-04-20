@tool
extends CSGBox3D

@export var speed = 3:
	set(x):
		speed = x

func _process(delta: float) -> void:
	rotation.x += delta * speed	
