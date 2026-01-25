extends Node3D
class_name PlayerManager

@export var player_prefab:PackedScene
@export var player:GameEntity

func get_player () -> GameEntity:
	if player:
		return player
	else:
		return null

func on_player_death ():
	player = null
