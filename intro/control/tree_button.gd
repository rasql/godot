extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = $Tree
	tree.columns = 3
	tree.column_titles_visible = true
	tree.hide_root = true
	var root = tree.create_item()
	var item
	#var button = Texture2D.new()
	var button = load("res://control/icons/Tiles/tile_0000.png")
	var icon = load("res://control/icons/Tiles/tile_0066.png")
	
	print(button)
	for x in ['Apple', 'Pear', 'Orange']:
		item  = tree.create_item(root)
		item.set_icon(0, icon)
		item.set_text(0, x)
		item.set_suffix(0, 'pixels')
		item.set_editable(0, true)
		
		item.add_button(0, button, -1, false, 'Edit')
		item.add_button(0, button, -1, false, 'File')
		item.add_button(2, button, -1, false,  'Run')
		#item.set_custom_bg_color(2, Color.HOT_PINK)
		#item.set_custom_color(0, Color.YELLOW)
		#item.set_custom_bg_color(1, Color.MOCCASIN)
		item.set_checked(0, true)
		item.set_checked(1, false)
		item.set_checked(2, true)
		
		
		
	
	var subchild1 = tree.create_item(item)
	subchild1.set_text(0, "Subchild1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tree_button_clicked(item, column, id, mouse_button_index):
	printt(item, column, id, mouse_button_index)
