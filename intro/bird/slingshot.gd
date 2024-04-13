extends Node2D

enum SlingState {
	IDLE,
	PULLING,
	THROWN,
	RESET,
}

var state : SlingState
var line1
var line2

# Called when the node enters the scene tree for the first time.
func _ready():
	state = SlingState.IDLE
	line1 = $Line1
	line2 = $Line2


func _on_touch_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouse:
		if event.is_pressed():
			var p0 = $Center.position
			var p1 = get_global_mouse_position()
			$TouchArea.position = p1
			const d = 300
		
			if p1.distance_to(p0) > d:
				p1 = (p1 - p0).normalized() * d + p0
		
			line1.points[1] = p1
			line2.poin
		else:
			pass
			
	match state:
		SlingState.IDLE:
			pass
		SlingState.PULLING:
			pass
		SlingState.THROWN:
			pass
		SlingState.RESET:
			pass
	
