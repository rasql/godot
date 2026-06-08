@tool
extends Control

var path = "res://books/alice.txt"
var histogram


## returns a dictionary with the count of each word from the words list
func get_histogram(words):
	var dict : Dictionary[String, int] = {}
	
	for word in words:
		if word not in dict:
			dict[word] = 1
		else:
			dict[word] += 1
	dict.sort()
	return dict
	
## returns a 3-column array (word, lenght, count) from the vocabulary
func get_array(vocab):
	var hist = []
	for key in vocab:
		hist.append([key, key.length(), vocab[key]])
	return hist
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	
	if not file:
		print("Error: ", FileAccess.get_open_error())
		return

	var content = file.get_as_text()
	$TextEdit.text = content
	
	print("path: ", path)
	print("size: ", content.length())
	
	var begin = "[Illustration]"
	var i_begin = content.find(begin) + len(begin) + 4
	content = content.right(-i_begin)
		
	var end = "THE END"
	var i_end = content.find(end)
	content = content.left(i_end)
	
	content = content.remove_chars(",;:!?()[]‘’“”*_$0123456789#%=+")
	
	content = content.replace("\n", " ")
	content = content.replace("—", " ")
	content = content.replace(".", " ")
	content = content.replace("/", " ")
	content = content.replace("  ", " ")
	
	content = content.to_lower()
	var words = content.split(" ")
	print("words ", words.size())
	
	var vocab = get_histogram(words)
	
	histogram = get_array(vocab)
		
	$TreeTable.load(histogram)
