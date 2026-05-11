extends Node


func _on_accept_dialog_canceled() -> void:
	print('dialog cancelled')

func _on_accept_dialog_confirmed() -> void:
	print('dialog confirmed')


func _on_file_dialog_dir_selected(dir: String) -> void:
	print('directory selected: ', dir)
	
func _on_file_dialog_file_selected(path: String) -> void:
	print('file selected: ', path)
