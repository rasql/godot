extends Control

var doc = """Test extended Tree class with classes, methods and signals."""

# Called when the node enters the scene tree for the first time.
func _ready():
	var classes = ClassDB.get_class_list()
	$Classes.set_list(classes, 'Classes')
	print(classes[0])
	
	var methods = ClassDB.class_get_method_list('Button')
	methods = methods.map(func(x): return x['name'])
	$Methods.set_list(methods, 'Methods')

	var signals = ClassDB.class_get_signal_list('Button')
	signals = signals.map(func(x): return x['name'])
	$Signals.set_list(signals, 'Signals')
