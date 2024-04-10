extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var classes = ClassDB.get_class_list()
	$Classes.set_list(classes, 'Classes')
	
	var methods = ClassDB.class_get_method_list('Button')
	$Methods.set_list(methods, 'Methods')

	var signals = ClassDB.class_get_signal_list('Button')
	$Signals.set_list(signals, 'Signals')
