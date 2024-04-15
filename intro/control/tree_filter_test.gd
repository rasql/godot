extends HBoxContainer

var doc = "Test TreeContainer with filter"


func _ready():
	var classes = ClassDB.get_class_list()
	$Classes.set_list(classes, 'Classes')
	
	var methods = ClassDB.class_get_method_list('Button')
	methods = methods.map(func(x): return x['name'])
	$Methods.set_list(methods, 'Methods')

	var signals = ClassDB.class_get_signal_list('Button')
	signals = signals.map(func(x): return x['name'])
	$Signals.set_list(signals, 'Signals')
