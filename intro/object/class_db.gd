extends Control

var classes
var _class
var enums
var signals
var methods
var properties


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = """Display a PackedStringArray and a Dictionary in a Tree."""
	
	classes = ClassDB.get_class_list()
	set_tree($Classes, classes, 'Classes')


func set_tree(tree: Tree, list: Array, title: String, 
		clear=true, size=true):
	if clear:
		tree.clear()
	tree.column_titles_visible = true
	if size:
		title +=  " (%d)" % list.size()
	tree.set_column_title(0, title)
	tree.set_column_title_alignment(0, HORIZONTAL_ALIGNMENT_LEFT)
	tree.create_item()
	tree.hide_root = true
	for i in list:
		var item = tree.create_item()
		if i is Dictionary:
			i = i["name"]
		item.set_text(0, i)	
		
func set_tree_from_dict(tree: Tree, dict: Dictionary):
	tree.clear()
	tree.column_titles_visible = true
	tree.columns = 2
	tree.set_column_title(0, 'Name')
	tree.set_column_title(1, 'Value')
	tree.set_column_title_alignment(0, HORIZONTAL_ALIGNMENT_LEFT)
	tree.set_column_title_alignment(1, HORIZONTAL_ALIGNMENT_LEFT)
	tree.create_item()
	tree.hide_root = true
	for k in dict:
		var item = tree.create_item()
		item.set_text(0, k)
		item.set_text(1, str(dict[k]))
		
func set_tree_dict(tree: Tree, list: Array):
	tree.clear()
	if list == []:
		return
	tree.column_titles_visible = true
	tree.hide_root = true
	tree.create_item()
	tree.columns = list[0].size()
	var dict = list[0]
	for i in range(list.size()):
		var item = tree.create_item()
		var j = 0
		for k in list[0]:
			if i == 0:
				tree.set_column_title(j, k)
				tree.set_column_title_alignment(j, HORIZONTAL_ALIGNMENT_LEFT)
			item.set_text(j, str(list[i][k]))
			j += 1


func _on_class_item_selected():
	var item = $Classes.get_selected()
	var i = item.get_index()
	_class = item.get_text(0)

	var no_inherit = not $Inheritance.button_pressed
	print('Inheritance ', $Inheritance.button_pressed)
	
	enums = ClassDB.class_get_enum_list(_class, no_inherit)
	set_tree($Enums, enums, 'Enumerations')
	
	signals = ClassDB.class_get_signal_list(_class, no_inherit)
	set_tree($Signals, signals, 'Signals')
	
	methods = ClassDB.class_get_method_list(_class, no_inherit)
	set_tree($Methods, methods, 'Methods')
	#set_tree_dict($Methods, methods)
	
	properties = ClassDB.class_get_property_list(_class, no_inherit)
	set_tree($Properties, properties, 'Properties')


func _on_inheritance_toggled(toggled_on):
	_on_class_item_selected()


func _on_methods_item_selected():
	var item = $Methods.get_selected()
	var i = item.get_index()
	set_tree_from_dict($Methods2, methods[i])
	

func _on_enums_item_selected():
	var item = $Enums.get_selected()
	var i = item.get_index()
	var _enum = item.get_text(0)
	var constants = ClassDB.class_get_enum_constants(_class, _enum)
	set_tree($Enums2, constants, 'Constants')
