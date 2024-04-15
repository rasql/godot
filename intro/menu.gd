extends Node
# Displays a 1st level clickable directory tree (folders) 
# Displays a 2nd level clickable schene file (tscn) tree (files)

var doc = """Select the category and the scene to display."""

var path = "res://"
var folders
var folder
var files
var file
var scene
var scenes
var menu_visible = true
var id # voice id

func _input(event):
	if event is InputEventKey and event.is_pressed():
		var key = event.as_text_key_label()
		match key:
			'Option':
				menu_visible = not menu_visible
				$Dirs.visible = menu_visible
				$Files.visible = menu_visible
				if menu_visible:
					$Control.offset_left = 278
				else:
					$Control.offset_left = 0
			
			'0' : scene = ''
			'1' : scene = 'texture/camera'
			'2' : scene = 'texture/canvas'
			'3' : scene = 'texture/gradient'
			'4' : scene = 'texture/grid'
			'5' : scene = 'texture/noise'
			'6' : scene = 'texture/curve'
			'7' : scene = 'control/tree_test'
			'8' : scene = 'gui/sound'
			'9' : scene = ''
			'T' : print_tree_pretty()
			'Option+Space':
				$AudioStreamPlayer.playing = not $AudioStreamPlayer.playing
				
		if key in '0123456789':
			$Dirs.visible = false
			$Files.visible = false
			get_tree().change_scene_to_file("res://" + scene + ".tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	print('menu _ready()')
	var voices = DisplayServer.tts_get_voices_for_language('en')
	id = voices[0]
	$AudioStreamPlayer.playing = false
	folders = Array(DirAccess.get_directories_at(path))
	folders = folders.filter(func(x) : return x not in ['audio', 'addons'])
	$Dirs.set_list(folders)
	$ColorRect/Label.text = doc
	$Window.hide()


func _on_dirs_cell_selected():
	var item = $Dirs.get_selected()
	#var i = item.get_index()
	folder = item.get_text(0)
	files = Array(DirAccess.get_files_at(path+folder))
	files = files.filter(func(x): return x.get_extension() == 'tscn')
	files = files.map(func(x): return x.get_basename())
	
	$Files.set_list(files)


func _on_files_cell_selected():
	var item = $Files.get_selected()
	#var i = item.get_index()
	file = item.get_text(0)
	var _path = path + folder + '/' + file + '.tscn'
	
	# show script code in a window
	var script_path = path + folder + '/' + file + '.gd'
	var f = FileAccess.open(script_path, FileAccess.READ)
	if f:
		$Window.show()
		$Window.title = file + '.gd'
		$Window/CodeEdit.text = f.get_as_text()
	else:
		$Window.hide()
	
	# load scene
	scene = load(_path)
	for child in $Control.get_children():
		child.free()
	var node = scene.instantiate()
	$Control.add_child(node)
	
	if node.get_class() in ['GPUParticles2D', 'CPUParticles2D']:
		node.position = Vector2(400, 300)
		node.scale = Vector2(3, 3)
		node.local_coords = true
	
	var s = ''
	if node.get('doc'):
		s = node.doc
	elif node.editor_description:
		s= node.editor_description
		
	$ColorRect/Label.text = s
	DisplayServer.tts_stop()
	DisplayServer.tts_speak(s, id)


func _on_window_close_requested():
	$Window.hide()
