extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	freeze_mode = RigidBody2D.FREEZE_MODE_STATIC


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func throw_bird():
	freeze_mode = RigidBody2D.FREEZE_MODE_STATIC
