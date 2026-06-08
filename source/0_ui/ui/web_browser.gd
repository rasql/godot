extends Control

# Making a web browser from scratch
# https://www.youtube.com/watch?v=URszvAXXzFs

@onready var rich_text: RichTextLabel = $HTTPRequest/HBoxContainer/RichTextLabel
@onready var text: RichTextLabel = $HBoxContainer2/RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HTTPRequest.request("https://godotengine.org")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	text.text = body.get_string_from_utf8()


func _on_button_pressed() -> void:
	$HTTPRequest.request($HBoxContainer/LineEdit.text)
	
func inner_html(tag, html):
	var regex = RegEx.new()
	regex.compile("<" + tag + ">(.|\n)*'</" + tag + ">")
	#if result:
		#return result.get_string().replaced
	 
