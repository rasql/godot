@tool
extends WorldEnvironment

@onready var fire = preload("res://particles/fire.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(8):
		var f = fire.instantiate()
		f.position = Vector2(50 + i * 50, 100)
		add_child(f)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
