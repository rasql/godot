@tool
extends Node3D
class_name RandomColor
## 
	
@export var gradient : Gradient:
	set(x):
		gradient = x
		update()

		
@export_tool_button("Update", "BoxMesh") var action = update


func update():
	if not is_inside_tree(): 
		return
	var children = get_children()
	for child in children:
		#print(child)
		#print(child.get_class())
		if child is MeshInstance3D:
			child.mesh = child.mesh.duplicate()
			if not child.mesh.material:
				child.mesh.material = StandardMaterial3D.new()
			child.mesh.material = child.mesh.material.duplicate()
			child.mesh.material.albedo_color = gradient.sample(randf())
		if child is CSGPrimitive3D:
			if not child.material:
				child.material = StandardMaterial3D.new()
			child.material.albedo_color = gradient.sample(randf())
			

func _ready() -> void:
	update()
