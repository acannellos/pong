extends CanvasLayer

var game_state = Enums.GameState.PLAYING

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta):
	pass


func _unhandled_input(event: InputEvent):

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
