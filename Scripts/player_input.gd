extends Node2D

@export var speed = 600

@export var player_1: CharacterBody2D
@export var player_2: CharacterBody2D

func _physics_process(delta):

	player_1.velocity.y = Input.get_axis("p1_up", "p1_down") * speed
	player_1.move_and_slide()

	player_2.velocity.y = Input.get_axis("p2_up", "p2_down") * speed
	player_2.move_and_slide()
