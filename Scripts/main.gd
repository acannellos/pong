extends CanvasLayer

var game_state = Enums.GameState.PLAYING

var ball_prefab = preload("res://ball.tscn")
var ball

@onready var players = $players

var left_score: int = 0
var right_score: int = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	ball = ball_prefab.instantiate()
	add_child(ball)

func _process(delta):
	pass

func reset():
	ball.queue_free()
	ball = ball_prefab.instantiate()
	add_child(ball)

func _unhandled_input(event: InputEvent):

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_left_goal_body_entered(body):
	left_score += 1
	$UI/ScoreRight.text = str(left_score)
	players.reset()
	reset()


func _on_right_goal_body_entered(body):
	right_score += 1
	$UI/ScoreLeft.text = str(right_score)
	players.reset()
	reset()
