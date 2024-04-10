@tool
extends EditorScript

var classes

# This function is run from the Editor's File menu 
# Shortcut : cmd + maj + X

func _run():
	print('hello from Godot editor')
	classes = ClassDB.get_class_list()
	print(classes)
	
