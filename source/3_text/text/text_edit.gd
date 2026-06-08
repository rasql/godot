extends Control

@onready var text: TextEdit = $Text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_text_caret_changed() -> void:
	print("caret changed")


func _on_text_gutter_added() -> void:
	print("gutter added")


func _on_button_pressed() -> void:
	print(text.get_selected_text())
