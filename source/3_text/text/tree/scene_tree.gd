extends Control

@onready var tree: Tree = $HBoxContainer/Tree
@onready var text: TextEdit = $HBoxContainer/TextEdit

var voice_id = DisplayServer.tts_get_voices_for_language("en")[0]

func add_children(node, item):
	for child_node in node.get_children():
		var tree = item.get_tree()
		var node_class = child_node.get_class()
		var child_item = tree.create_item(item)
		
		child_item.set_text(0, child_node.name)
		child_item.set_text(1, child_node.get_class())
		child_item.set_text(2, child_node.get_path())	
		child_item.set_metadata(0, child_node.get_path)
		add_children(child_node, child_item)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tree.columns = 3
	tree.column_titles_visible = true
	tree.set_column_title(0, "Node")
	tree.set_column_title(1, "Type")
	tree.set_column_title(2, "Path")
	
	var scene_root = get_tree().root
	var tree_root = tree.create_item()
	tree.hide_root = true
	add_children(scene_root, tree_root)

func _on_tree_cell_selected() -> void:
	var item = tree.get_selected()
	var row = item.get_index()
	var col = tree.get_selected_column()
	var content = item.get_text(col)
	
	text.text += "cell %s, %s selected: %s\n" % [row, col, content]
	DisplayServer.tts_stop()
	DisplayServer.tts_speak(content, voice_id)

func _on_tree_column_title_clicked(column: int, mouse_button_index: int) -> void:
	text.text += "column %s %s clicked\n" % [column, mouse_button_index ]
