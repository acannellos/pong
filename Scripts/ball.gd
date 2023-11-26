extends CharacterBody2D

@export var reset_pos: Vector2 = Vector2(400,300)
@export var start_speed: float = 200.0  # Speed of the ball
@export var paddle_angle_factor := 10
var vel := Vector2.ZERO
var direction: int = 0

var max_speed: float = 2000.0

@onready var wall = $sounds/wall
@onready var floor = $sounds/floor

func _ready():
	position = reset_pos

	direction = randi() % 2
	if direction == 0:
		vel.x = start_speed
	else:
		vel.x = -start_speed
#
func _physics_process(delta):

	set_velocity(vel)
	set_up_direction(Vector2.UP)
	move_and_slide()

	if is_on_ceiling() or is_on_floor():
		vel.y = -vel.y
		print("ceiling floor hit")
		floor.play()
		#$Wall.play()

	if is_on_wall():
		vel.x = -vel.x

		if abs(vel.x * 1.1) <= max_speed and abs(vel.y * 1.1) <= max_speed:
			vel *= 1.1

		print("wall hit")
		wall.play()
		#$Paddle.play()

		for slide in get_slide_collision_count():
			var collision = get_slide_collision(slide)
			vel.y = (transform.origin.y - collision.get_collider().position.y) * paddle_angle_factor
