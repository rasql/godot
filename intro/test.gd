@tool
extends EditorScript

var classes
@export var string = 'Hello'


# This function is run from the Editor's File menu 
# Shortcut : cmd + maj + X

func _run():
	print('hello from Godot editor')
	classes = ClassDB.get_class_list()
	print(classes)
	print('ranges')
	print(range(10))
	print(range(10, 20))
	print(range(20, 40, 2))
	print(range(100, 90, -1))
	print('db -60 = ', db_to_linear(-60))
	print('db 80 = ', db_to_linear(80))
	print('randf() =', randf())
	print('randi() =', randi())	
	for i in range(10):
		printt(i, type_string(i))
		
