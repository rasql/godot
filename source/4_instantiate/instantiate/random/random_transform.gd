
@tool
extends Node3D
	
@export var position_max = Vector3(0, 0, 0)
	#set(x):
		#position_max = x
		#update()
		
@export var rotation_max = Vector3(0, 0, 0)
	#set(x):
		#rotation_max = x
		#update()

@export var scale_max = 1.0
	#set(x):
		#scale_max = x
		#update()	
		
@export_tool_button("Update", "BoxMesh") var action = update


func update():
	position = position_max * Vector3(randf(), randf(), randf())
	rotation = rotation_max * Vector3(randf(), randf(), randf()) * PI / 180.0
	scale = Vector3.ONE * randf_range(1, scale_max)


func _ready() -> void:
	update()
