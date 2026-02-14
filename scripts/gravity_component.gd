extends Node

class_name GravityComponent

func process_gravity(actor: HittableCharacterBody) -> void:
	if !actor.is_on_floor():
		actor.velocity.y += Constants.GRAVITY
