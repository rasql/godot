extends Control

@onready var tree: Tree = $Tree
var child

func _ready():
	var tree = Tree.new()
	tree.size = Vector2(400, 400)
	tree.position = Vector2(800, 40)
	tree.columns = 2
	tree.column_titles_visible = true
	tree.set_column_title(0, 'Column 0')
	tree.set_column_title(1, 'Column 1')
	
	var root = tree.create_item()
	tree.hide_root = true
	add_child(tree)

	for i in 3:
		var child = tree.create_item(root)
		child.set_text(0, "Child" + str(i))
		child.collapsed = true
		for j in 3:
			var subchild = tree.create_item(child)
			subchild.set_text(0, "Subchild " + str(i) + str(j))
			subchild.set_text(1, str(randi()))
		
func _on_clear_pressed() -> void:
	tree.clear()
	
func _on_add_child_pressed() -> void:
	child = tree.create_item()
	child.set_text(0, "Child")
	
func _on_sub_child_pressed() -> void:
	var sub_child = tree.create_item(child)
	sub_child.set_text(0, "Sub-Child")
	
func _on_add_check_pressed() -> void:
	child = tree.create_item()
	child.set_cell_mode(0, TreeItem.CELL_MODE_CHECK)
	child.set_text(0, "Checkbox")
	child.set_editable(0, true)

func _on_add_range_pressed() -> void:
	child = tree.create_item()
	child.set_cell_mode(0, TreeItem.CELL_MODE_RANGE)
	child.set_range(0, 50)
	child.set_editable(0, true)

func _on_add_option_pressed() -> void:
	child = tree.create_item()
	child.set_cell_mode(0, TreeItem.CELL_MODE_RANGE)
	child.set_text(0, "Option 1, Option 2, Option 3")
	child.set_editable(0, true)
