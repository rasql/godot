extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_button_down() -> void:
	print('\nButton down')
	
func _on_button_button_up() -> void:
	print('Button up')

func _on_button_pressed() -> void:
	print('Button pressed')

func _on_button_toggled(toggled_on: bool) -> void:
	print('Button toggled')


func _on_color_picker_button_color_changed(color: Color) -> void:
	print('Color changed: ', color)


func _on_option_button_item_focused(index: int) -> void:
	print('Item focused: ', index)
	
func _on_option_button_item_selected(index: int) -> void:
	print('Item selected: ', index)
