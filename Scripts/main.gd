extends Node2D

@export_group("screen")
@export var screen_width: int = 800
@export var screen_height: int = 600

func _ready():
	get_window().size = Vector2i(screen_width, screen_height)

func _process(delta):
	pass
