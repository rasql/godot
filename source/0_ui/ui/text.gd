extends Control

@onready var raw_text: TextEdit = $HBoxContainer/TextEdit
@onready var rich_text: RichTextLabel = $HBoxContainer/RichTextLabel

func _on_text_edit_text_changed() -> void:
	rich_text.text = raw_text.text

func _on_button_pressed() -> void:
	OS.shell_open($LineEdit.text)
