extends Node

class_name FixedMoveComponent

@export_group("")
@export var speed: float
@export var distance_left: float
@export var distance_right: float
@export var start_facing_right: bool
@export_group("FIXED")

var starting_position_x: float
@onready var facing_right: bool = start_facing_right

func setup(new_starting_position_x: float) -> void:
	starting_position_x = new_starting_position_x

func process_move(actor: HittableCharacterBody) -> void:
	if starting_position_x - actor.position.x >= distance_left:
		facing_right = true
	elif actor.position.x - starting_position_x >= distance_right:
		facing_right = false
	
	if facing_right:
		actor.velocity.x = speed
	else:
		actor.velocity.x = -speed
