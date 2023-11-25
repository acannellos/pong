extends Node2D

@export var line_color: Color = Color(1, 1, 1)
@export var line_length: int = 4
@export var line_spacing: int = 10
@export var x_position: int = 0
@export var is_centered: bool = true

func _draw():
	if is_centered:
		x_position = get_viewport_rect().size.x / 2

	var current_y = 0
	while current_y < get_viewport_rect().size.y:
		draw_line(Vector2(x_position, current_y), Vector2(x_position, current_y + line_length), line_color, 1)
		current_y += line_spacing

