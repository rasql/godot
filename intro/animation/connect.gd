extends Node

# define variables for nodes which are assigned only when the scenes are loaded in the scene tree
# use drag + ctrl (first drag, then press ctrl)
@onready var icon: Sprite2D = $Icon
@onready var button_1: Button = $Button1
@onready var button_2: Button = $Button2

@onready var tween := get_tree().create_tween()

func _ready() -> void:
	# connect a callback function by code using connect() and bind()
	button_1.pressed.connect(my_button.bind(button_1))
	button_2.pressed.connect(my_button.bind(button_2))
	
	# add a second callback function for mouse_entered
	button_1.mouse_entered.connect(on_mouse.bind(button_1))
	button_2.mouse_entered.connect(on_mouse.bind(button_2))
	
	# add a second callback function using a lambda
	button_1.mouse_exited.connect(func(): print(button_1.name, " exited"))
	button_2.focus_entered.connect(func(): print(button_2.name, " focus entered"))
	
	print(tween)
	var icon = Sprite2D.new()
	add_child(icon)
	
# callback function
func my_button(b):
	print(b.name, ' pressed')
	print('timer created')
	await get_tree().create_timer(1.0).timeout
	print('timeout for ', b.name)
	tween.tween_property($Icon, "position", b.position, 1)
	print(b.position)

	
func on_mouse(b):
	print(b.name, ' entered')
	await get_tree().create_timer(0.5).timeout
	print(b.name, ' entered 0.5s ago')
	
