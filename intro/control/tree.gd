extends Tree

@export var debug = false

func set_list(list: Array, title="", _clear=true, show_size=true):
	if _clear:
		self.clear()
	self.column_titles_visible = false
	if title:
		self.column_titles_visible = true
		if show_size:
			title +=  " (%d)" % list.size()
		self.set_column_title(0, title)
		self.set_column_title_alignment(0, HORIZONTAL_ALIGNMENT_LEFT)
	self.create_item()
	self.hide_root = true
	for i in list:
		var item = self.create_item()
		if i is Dictionary:
			i = i["name"]
		item.set_text(0, i)	


# Called when the node enters the scene tree for the first time.
func _ready():
	if debug:
		var classes = ClassDB.get_class_list()
		printt(self)
		self.set_list(classes, 'Classes')
