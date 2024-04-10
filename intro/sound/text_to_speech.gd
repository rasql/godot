extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var path = "user://"
	print(path)
	var dir = DirAccess.open(path)
	print(dir)
	print(dir.list_dir_begin())
	
	var file = dir_get_next()
	print(file)
	print(dir.get_current_dir()
	if dir:
		var file = dir.net_next()
		
		while file:
			if dir.current_is_dir():
				$TextEdit.text += file + "\n"
			file = dir.get_next()
			print(file)
	else:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
