extends Area2D

class_name TeleportArea

func get_closest_enemy() -> Enemy:
	
	var closest_enemy: Enemy = null
	var nodes: Array[Node2D] = get_overlapping_bodies()
	
	for node: Node2D in nodes:
		if node is Enemy:
			if closest_enemy == null:
				closest_enemy = node
				continue
			if global_position.distance_squared_to(node.global_position) < global_position.distance_squared_to(closest_enemy.global_position):
				closest_enemy = node
	
	return closest_enemy
