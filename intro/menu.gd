extends Node

# Displays a 1st level clickable directory tree (folders) 
# Displays a 2nd level clickable schene file (tscn) tree (files)

var doc := """Select the category and the scene to display."""

#@export var variable # not valid without type specifier
@export_group("Group")
@export var label := 'hello'
@export var label2 : String = 'hello'
@export_multiline var label3 := 'here'

@export_subgroup("Subgroup 1")
@export var number : int
@export var number2 : int = 10
@export var number3 := 20

@export_subgroup("Subgroup 2")
@export var visible : bool
@export var visible2 := true
# Set any of the given flags from the editor.
@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements = 5

@export_group("Array types")
@export var array_type := ['apple', 'orange']
@export var array_type2 : PackedStringArray = ['apple', 'orange']
@export var dict = {'name' = 'James', id=1007}

@export_group("Files")
@export_file var f
@export_dir var dir

@export_group("Ranges")
@export_range(0, 20) var i : int
@export_range(-10, 20) var j : int
@export_range(-10, 20, 0.2) var k: float
@export_exp_easing var transition_speed : float = 0.1
@export var col := Color.RED
@export_color_no_alpha var col2: Color

@export_group("Nodes")
@export var node: Node
# Allows any node that inherits from BaseButton.
# Custom classes declared with `class_name` can also be used.
@export var node_2d: Node2D

@export var resource: Resource
@export var resource2: AnimationNode
@export var resource3: AnimationRootNode

enum NamedEnum {THING_1, THING_2, ANOTHER_THING = -1}
@export var enums: NamedEnum
@export_enum("Warrior", "Magician", "Thief") var character_class: int
@export_enum("Slow:30", "Average:60", "Very Fast:200") var character_speed: int
@export_enum("Rebecca", "Mary", "Leah") var character_name: String

@export_category("Category")
@export var string := "hi"
@export var flag := false

var path = "res://"
var folders : Array
var folder : String
var files : Array
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
				$ColorRect.visible = menu_visible
				if menu_visible:
					$Control.offset_left = 278
				else:
					$Control.offset_left = 0
			
			'0' : scene = ''
			'1' : scene = 'dodge2d/main'
			'2' : scene = 'dodge3d/main'
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
			$ColorRect.visible = false
			menu_visible = false
			
			# load scene
			scene = load("res://" + scene + ".tscn")
			for child in $Control.get_children():
				child.free()
			var node = scene.instantiate()
			$Control.add_child(node)


# Called when the node enters the scene tree for the first time.
func _ready():
	print('menu _ready()')
	var voices = DisplayServer.tts_get_voices_for_language('en')
	id = voices[0]
	$AudioStreamPlayer.playing = false
	folders = Array(DirAccess.get_directories_at(path))
	folders = folders.filter(func(x) : return x not in ['VisualShaderNodeScreenUVToSDF', 'addons'])
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
	#if f:
		#$Window.show()
		#$Window.title = file + '.gd'
		#$Window/CodeEdit.text = f.get_as_text()
	#else:
		#$Window.hide()
	
	# load scene
	scene = load(_path)
	for child in $Control.get_children():
		child.free()
	var node = scene.instantiate()
	$Control.add_child(node)
	
	# release focus to $Control
	$Files.release_focus()
	
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
