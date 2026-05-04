@tool
extends Node3D


@export var message: String = "hello" ## Text string
@export var flag = false ## Boolean flag
@export_multiline var text = "Long text with\nline1\nline2\nline3"

@export_file var path

@export_tool_button("Split", "CSGBox3D") var action1 = text1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.

func text1():
	for child in get_children():
		child.free()
		
	# 1. Open the file for reading
	print(path)
	var file = FileAccess.open(path, FileAccess.READ)
	
	# 2. Check if the file actually exists/opened correctly
	if not file:
		print("Error: ", FileAccess.get_open_error())
		return
	
	# 3. Read the content
	var content = file.get_as_text()
	
	print('size: ', content.length())
	var words = content.split(' ')
	print('words: ', words.size())
	
	# The file closes automatically when 'file' is no longer used
	
	
	
	words = text.split(" ")
	print(words)
	
	
	for word in words:
		var node = Label3D.new()
		node.text = word
		node.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		node.position = Vector3(randfn(0, 2), 0, randfn(0, 2))
		node.name = "Word"
		add_child(node, true)
		node.owner = get_tree().edited_scene_root
