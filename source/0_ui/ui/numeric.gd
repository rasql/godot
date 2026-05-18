extends Control


func _on_h_slider_value_changed(value: float) -> void:
	$ProgressBar.value = value

func _on_h_scroll_bar_value_changed(value: float) -> void:
	$HScrollBar/Value.text = "value = " + str(value)

func _on_v_slider_value_changed(value: float) -> void:
	$TextureProgressBar.value = value
