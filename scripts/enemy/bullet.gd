extends Area2D

class_name Bullet

var config: Dictionary[Enums.BulletConfigOptions, Variant]
var action: Callable
var parent: HittableCharacterBody

var t: float = 0.0


func setup(new_config: Dictionary, actor: HittableCharacterBody) -> bool:
	
	add_to_group(Constants.BULLET_STRING + actor.to_string())
	parent = actor
	config = new_config
	
	if !config.has(Enums.BulletConfigOptions.BEHAVIOUR):
		return false
	
	if config[Enums.BulletConfigOptions.BEHAVIOUR] == Enums.BulletBehaviours.STRAIGHT:
		if !config.has(Enums.BulletConfigOptions.SPEED):
			return false
		if !config.has(Enums.BulletConfigOptions.DIRECTION):
			return false
		
		action = func(delta: float):
			position += delta * config[Enums.BulletConfigOptions.SPEED] * Vector2.from_angle(config[Enums.BulletConfigOptions.DIRECTION])
		return true
	
	if config[Enums.BulletConfigOptions.BEHAVIOUR] == Enums.BulletBehaviours.SINE:
		if !config.has(Enums.BulletConfigOptions.SPEED):
			return false
		if !config.has(Enums.BulletConfigOptions.AMPLITUDE):
			return false
		
		action = func(delta: float):
			position.x += Enums.BulletConfigOptions.SPEED * cos(t) * delta - Enums.BulletConfigOptions.AMPLITUDE * sin(t) * cos(t)
			position.y += Enums.BulletConfigOptions.SPEED * sin(t) * delta + Enums.BulletConfigOptions.AMPLITUDE * cos(t) * cos(t)
			t += delta
	
	return false

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
