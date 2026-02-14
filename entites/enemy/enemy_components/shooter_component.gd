extends Node

class_name ShooterComponent

@export_group("FIXED")
@export var bullet_scene: PackedScene
@export var timer: Timer
@export_group("")
@export var bullet_behaviour: BulletBehaviour
@export var shoot_delay: float

@onready var to_shoot: bool = true

func _ready() -> void:
	timer.wait_time = shoot_delay

func process_shooting(actor: CharacterBody2D) -> void:
	
	if to_shoot == false:
		return
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.setup(bullet_behaviour, actor)
	
	get_tree().current_scene.add_child(bullet)
	to_shoot = false
	timer.start()

func _on_timer_timeout() -> void:
	to_shoot = true
