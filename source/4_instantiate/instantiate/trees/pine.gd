@tool
extends Node3D

@export var trunk_color : Color = Color.BROWN:
	set(x):
		trunk_color = x
		
@export var body_color : Color = Color.LAWN_GREEN:
	set(x):
		body_color = x

@export var tree_color_gradient : Gradient:
	set(x):
		tree_color_gradient = x
		update()

@export var a : Array

@export_tool_button("Update", "BoxMesh") var action = update


@onready var trunk: MeshInstance3D = $Trunk
@onready var body: MeshInstance3D = $Trunk/Body


func update():
	# 1. SAFETY CHECK: Ensure nodes exist before running logic in Editor
	if not is_inside_tree(): 
		return
	
	# If @onready hasn't fired yet (common in Editor), fetch them manually
	if not trunk: trunk = get_node_or_null("Trunk")
	if not body: body = get_node_or_null("Trunk/Body")
	
	if not trunk or not body:
		return

	# 2. RANDOM LOGIC
	trunk_color = Color.from_hsv(randf(), 0.8, 0.9)
	
	# Check if gradient exists before sampling
	if tree_color_gradient:
		body_color = tree_color_gradient.sample(randf())
		
		# 3. MATERIAL CHECK: Ensure materials are unique/exist
		# Use .set_albedo(col) or ensure material is not null
		#if trunk.material:
			#trunk.mesh = trunk.material.duplicate()
			#trunk.material = trunk.material.duplicate()
			#print('duplicate trunk material')
			#trunk.material.albedo_color = trunk_color # or col
		if body.mesh and body.mesh.material:
			body.mesh = body.mesh.duplicate()
			body.mesh.material = body.mesh.material.duplicate()
			body.mesh.material.albedo_color = body_color

func _ready() -> void:
	if Engine.is_editor_hint():
		update()
