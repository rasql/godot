extends Control

# Godot editor icons
# https://godotengine.github.io/editor-icons/

@onready var tree: Tree = $HBoxContainer/Tree
@onready var text: TextEdit = $HBoxContainer/TextEdit

var voice_id = DisplayServer.tts_get_voices_for_language("en")[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tree.hide_root = true
	tree.columns = 3
	tree.column_titles_visible = true
	for i in 3:
		tree.set_column_title(i, "Column " + str(i))
		
	var root = tree.create_item()
	var icon = load("res://icon.svg")
	var item = tree.create_item(root)
	
	item.set_text(0, "text with icon")
	item.set_icon(0, icon)
	item.set_text(1, "fontsize=40")
	item.set_custom_font_size(1, 40)
	item.set_icon(2, icon)
	item.set_text(2, "icon_max_width=40")
	item.set_icon_max_width(2, 40)
	
	icon = load("res://Tree.svg")
	item = tree.create_item(root)
	item.set_text(0, "text with icon")
	item.set_icon(0, icon)
	item.set_text(1, "custom_color=red")
	item.set_custom_color(1, Color('red'))
	item.set_text(2, "custom_bg_color=blue")
	item.set_custom_bg_color(2, Color('blue'))
	
	item = tree.create_item(root)
	item.set_text(0, "alignment=left")
	item.set_text(1, "alignment=center")
	item.set_text_alignment(1, HorizontalAlignment.HORIZONTAL_ALIGNMENT_CENTER)
	item.set_text(2, "alignment=right")
	item.set_text_alignment(2, HorizontalAlignment.HORIZONTAL_ALIGNMENT_RIGHT)
	
	# Try to add Editor icons
	# Does not work
	
	#icon = EditorInterface.get_editor_theme().get_icon("Tree", "EditorIcons")
	#icon = get_theme_icon("Tree", "EditorIcons")
	#icon = tree.get_theme_icon("Tree")
	#icon = tree.get_theme_icon(&"Search", &"EditorIcons")
	icon = get_theme_icon(&"Search", &"EditorIcons")
	
	var parent = tree.create_item(root)
	parent.set_text(0, "Parent") 
	for i in 3:
		item = tree.create_item(parent)
		item.set_edit_multiline(0, true)
		item.set_editable(0, true)
		item.set_text(0, "Child " + str(i))
		item.set_icon(0, icon)


func _on_tree_cell_selected() -> void:
	var sel = tree.get_selected().get_index()
	var col = tree.get_selected_column() 
	text.text += "cell %s %s \n" % [sel, col]

func _on_tree_button_clicked(item: TreeItem, column: int, id: int, mouse_button_index: int) -> void:
	text.text += "button " + str(item) + str(column) + "\n"

func _on_tree_column_title_clicked(column: int, mouse_button_index: int) -> void:
	text.text += "column %s, %s clicked\n" % [column, mouse_button_index]
