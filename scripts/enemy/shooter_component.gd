extends Node

class_name ShooterComponent

@export_group("FIXED")
@export var bullet_scene: PackedScene
@export var timer: Timer
@export_group("")
@export var bullet_behaviour: Enums.BulletBehaviours
@export var bullet_speed: float
@export var shoot_delay: float

@onready var to_shoot: bool = true

func _ready() -> void:
	timer.wait_time = shoot_delay

func process_shooting(actor: CharacterBody2D) -> void:
	
	if to_shoot == false:
		return
	
	var bullet_config: Dictionary[Enums.BulletConfigOptions, Variant] = {
		Enums.BulletConfigOptions.BEHAVIOUR: bullet_behaviour,
		Enums.BulletConfigOptions.SPEED: bullet_speed,
		Enums.BulletConfigOptions.DIRECTION: (Cache.player.position - actor.global_position).angle()
	}
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.global_position = actor.global_position
	var setup_value: bool = bullet.setup(bullet_config, actor)
	
	if !setup_value:
		printerr("unable to setup bullet")
		return
	
	get_tree().current_scene.add_child(bullet)
	to_shoot = false
	timer.start()


func _on_timer_timeout() -> void:
	to_shoot = true
