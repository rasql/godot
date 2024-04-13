@tool
extends Control

var doc = """DirAccess to get files and directories."""

var dir : DirAccess
var files : PackedStringArray
var file : String
var folders : PackedStringArray
var folder = ''
var path = "res://"


# Called when the node enters the scene tree for the first time.
func _ready():
	dir = DirAccess.open(path)
	$Label.text = path
	print(dir)
	print(dir.get_current_dir())
	dir.include_hidden = false
	dir.include_navigational = true
	folders = dir.get_directories()
	files = dir.get_files()
	$HBoxContainer/Dirs.set_list(folders, 'folders')
	$HBoxContainer/Files.set_list(files, 'Files')


func _on_dirs_cell_selected():
	var item = $HBoxContainer/Dirs.get_selected()
	folder = item.get_text(0) + '/'
	var _path = path + folder 
	print(_path)
	files = DirAccess.get_files_at(_path)
	$HBoxContainer/Files.set_list(files, 'Files')


func _on_files_cell_selected():
	var item = $HBoxContainer/Files.get_selected()
	file = item.get_text(0)
	var _path = path + folder + file
	print(_path)
	$TextureRect.visible = false
	$CodeEdit.visible = false
	match _path.get_extension():
		'gd', 'tscn', 'md', 'txt':
			print('text')
			var file = FileAccess.open(_path, FileAccess.READ)
			var content = file.get_as_text()
			$CodeEdit.text = content
			$CodeEdit.visible = true
		'png', 'jpg', 'tif', 'svg':
			print('image')
			var img = Image.load_from_file(_path)
			var tex = ImageTexture.create_from_image(img)
			$TextureRect.texture = tex
			$TextureRect.visible = true
		'ogg':
			print('sound')
			$AudioStreamPlayer.stream = load(_path)
			$AudioStreamPlayer.play()
		_ :
			print('other')

func _on_dirs_item_activated():
	path += folder
	
	dir = DirAccess.open(path)
	$Label.text = path
	print(dir)
	print(dir.get_current_dir())
	dir.include_hidden = false
	dir.include_navigational = true
	folders = dir.get_directories()
	files = dir.get_files()
	$HBoxContainer/Dirs.set_list(folders, 'folders')
	$HBoxContainer/Files.set_list(files, 'Files')
