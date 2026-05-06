@tool
extends Label

@export_file var path

@export_tool_button("Load", "CSGBox3D") var action1 = load


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func load():
	# 1. Open the file for reading
	print("open file: ", path)
	var file = FileAccess.open(path, FileAccess.READ)
	
	# 2. Check if the file actually exists/opened correctly
	if not file:
		print("Error: ", FileAccess.get_open_error())
		return
	
	# 3. Read the content
	var content = file.get_as_text()
	text = content
	
	print('size: ', content.length())
	var words = content.split(' ')
	print('words: ', words.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
