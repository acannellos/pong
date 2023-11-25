extends CharacterBody2D

@export var speed = 1200

func _physics_process(delta):
	velocity.y = Input.get_axis("p1_up", "p1_down") * speed
	move_and_slide()
