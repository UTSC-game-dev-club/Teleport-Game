extends Area2D

class_name Bullet

var parent: HittableCharacterBody
var action: Callable
var state: Dictionary = {}

func setup(bullet_behaviour: BulletBehaviour, new_parent: HittableCharacterBody) -> void:
	
	add_to_group(Constants.BULLET_STRING + new_parent.to_string())
	parent = new_parent
	if bullet_behaviour is BulletBehaviourStraight:
		position = parent.position
		state[&"speed"] = bullet_behaviour.speed
		state[&"direction"] = (Cache.get_player().global_position - global_position).angle()
		
		action = func(delta) -> void:
			position += delta * state[&"speed"] * Vector2(cos(state[&"direction"]), sin(state[&"direction"]))

func _physics_process(delta: float) -> void:
	action.call(delta)
 
func _on_body_entered(body: Node2D) -> void:
	if body == parent:
		return
	
	if body is HittableCharacterBody:
		body.get_hit()
		queue_free()
	
	if body is StaticBody2D:
		queue_free()
