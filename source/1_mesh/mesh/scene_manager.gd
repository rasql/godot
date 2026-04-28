extends Node

@export_file("*.tscn") var scenes: Array[String]


var current_index = 0

func _input(event):
	if event.is_action_pressed("ui_left"):
		# Move forward and wrap around using modulo
		current_index = (current_index + 1) % scenes.size()
		switch_scene()
		
	elif event.is_action_pressed("ui_right"):
		# Move backward and wrap around
		current_index = (current_index - 1 + scenes.size()) % scenes.size()
		switch_scene()

func switch_scene():
	# Use change_scene_to_file for Godot 4.x
	get_tree().change_scene_to_file(scenes[current_index])
	print("Switched to: ", scenes[current_index])
