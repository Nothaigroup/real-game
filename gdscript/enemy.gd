extends CharacterBody2D

@export var movement_speed  = 200.0

@onready var playerr = get_tree().get_first_node_in_group('huh')

func _physics_process(_delta):
	var directionn = global_position.direction_to(playerr.global_position)
	velocity = directionn*movement_speed
	move_and_slide()
