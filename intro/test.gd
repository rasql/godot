@tool
extends EditorScript

var classes
@export var string = 'Hello'

# ATTENTION
# WARNING
# INFO

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
	for i in 10:
		printt(i, type_string(i))
		
	#var parent = get_scene().get_node("Parent")
	#print(parent)
	#var node = Button.new()
	#par
	
	# loop variables (i, c, e) do not need to be declared
	# they only exist in the scope of the loop
	for i in 3:
		print(i)
	for c in 'abc':
		print(c)
	for e in [1, true, 'abc']:
		print(e)
	
	
		
