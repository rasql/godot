extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		var random_position := Vector3.ZERO
		random_position.x = randf_range(-5.0, 5.0)
		random_position.z = randf_range(-5.0, 5.0)
		navigation_agent_3d.set_target_position(random_position)
		
		
func _physics_process(delta):
	var destination = navigation_agent_3d.get_next_path_position()
	#var local_destination = destination - global
		
