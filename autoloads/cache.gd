extends Node

var player: Player

func setup(new_player: Player):
	player = new_player

func get_player() -> Player:
	if player == null:
		printerr("no player set in the cache")
		return null
	
	return player

func set_player(new_player: Player) -> void:
	player = new_player
