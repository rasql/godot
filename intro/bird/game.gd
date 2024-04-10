extends Node2D

enum GameState {
	START,
	PLAY,
	WIN,
	LOSE,
}

var state = GameState.START


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		GameState.START:
			pass
		GameState.PLAY:
			pass
		GameState.WIN:
			pass
		GameState.LOSE:
			print('you lose')
