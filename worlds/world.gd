extends Node2D

class_name World

func _ready() -> void:
	for node in get_children():
		if node is Player:
			Cache.set_player(node)
