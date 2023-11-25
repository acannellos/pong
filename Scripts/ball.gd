extends CharacterBody2D

@export var reset_pos: Vector2 = Vector2(400,300)
@export var start_speed: float = 200.0  # Speed of the ball
@export var paddle_angle_factor := 10
var vel := Vector2.ZERO
var direction: int = 0

func _ready():
	position = reset_pos
	
	direction = randi() % 2
	if direction == 0:
		vel.x = start_speed
	else:
		vel.x = -start_speed

func _physics_process(delta):
	
	set_velocity(vel)
	set_up_direction(Vector2.UP)
	move_and_slide()
	
	var _v = vel
	if is_on_ceiling() or is_on_floor():
		vel.y = -vel.y
		print("ceiling floor hit")
		#$Wall.play()
		
	if is_on_wall():
		vel.x = -vel.x
		print("wall hit")
		#$Paddle.play()
		
		for slide in get_slide_collision_count():
			var collision = get_slide_collision(slide)
			vel.y = (transform.origin.y - collision.get_collider().position.y) * paddle_angle_factor

