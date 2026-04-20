@tool
extends CSGSphere3D

@export_tool_button("Update", "BoxMesh") var action = update

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()

func update():
	material = material.duplicate()
	material.albedo_color = Color(randf(), randf(), randf())
