extends World

class_name TestWorld

@export var spawnpoints: Array[Marker2D]
@export var spawnpoint_index: int

func _ready() -> void:
	super()
	var player: Player = Cache.get_player()
	player.position = spawnpoints[spawnpoint_index].position
