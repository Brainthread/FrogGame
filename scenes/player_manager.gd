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

func spawn_player(spawn_position:Vector3) -> Node:
	var player_instance = player_prefab.instantiate()
	NodePaths.dynamic_scene_path.add_child(player_instance)
	var player_entity:EnemyEntity = player_instance as EnemyEntity
	player_entity.get_main_object().global_position = spawn_position
	return player_entity
