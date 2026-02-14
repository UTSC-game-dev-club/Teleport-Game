extends HittableCharacterBody

class_name Enemy
@export var gravity_component: GravityComponent
@export var fixed_move_component: FixedMoveComponent
@export var shooter_component: ShooterComponent

func _ready() -> void:
	
	
	if fixed_move_component:
		fixed_move_component.setup(position.x)

func _physics_process(_delta: float) -> void:
	
	gravity_component.process_gravity(self)
	if fixed_move_component:
		fixed_move_component.process_move(self)
	if shooter_component:
		shooter_component.process_shooting(self)
	
	move_and_slide()
	

func get_hit() -> void:
	queue_free()
