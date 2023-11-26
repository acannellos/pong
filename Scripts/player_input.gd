extends Node2D

@export var speed = 600

@export var player_1: CharacterBody2D
@export var player_2: CharacterBody2D

@export var p1_reset: Vector2
@export var p2_reset: Vector2

func _ready():
	reset()

func reset():
	player_1.position = p1_reset
	player_2.position = p2_reset

func _physics_process(delta):

	player_1.velocity.y = Input.get_axis("p1_up", "p1_down") * speed
	player_1.move_and_slide()

	player_2.velocity.y = Input.get_axis("p2_up", "p2_down") * speed
	player_2.move_and_slide()
