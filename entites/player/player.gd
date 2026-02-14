extends HittableCharacterBody

class_name Player

@export_group("FIXED")
@export var gravity_component: GravityComponent
@export var teleport_area: TeleportArea

@export_group("")
@export var SPEED: float = 100
@export var JUMP_SPEED: float = 350


#func _ready() -> void:
	#Cache.player = self

func swap(enemy: Enemy) -> void:
	if enemy != null:
		var temp_position: Vector2 = global_position
		global_position = enemy.global_position
		enemy.global_position = temp_position
		
		var bullets: Array[Node] = get_tree().get_nodes_in_group(Constants.BULLET_STRING + enemy.to_string())
		for bullet: Bullet in bullets:
			bullet.parent = null

func _physics_process(_delta: float) -> void:
	
	velocity.x = 0.0
	gravity_component.process_gravity(self)
	
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		teleport_area.rotation = PI
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		teleport_area.rotation = 0
	if Input.is_action_just_pressed("up") && is_on_floor():
		velocity.y = -JUMP_SPEED
	if Input.is_action_just_pressed("ui_accept"):
		var enemy: Enemy = teleport_area.get_closest_enemy()
		
		if enemy != null:
			call_deferred("swap", enemy)
	
	move_and_slide()

func get_hit() -> void:
	print("player got hit!")
