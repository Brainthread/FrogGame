extends Node3D
class_name EnemyManager

@export var test_enemy:PackedScene

func _ready() -> void:
	for n in 1000:
		await get_tree().create_timer(randf_range(0, 5)).timeout
		var spawn_vec:Vector3 = Vector3(randf_range(-1,1), 0, randf_range(-1, 1)).normalized()*randf_range(0, 5)
		var enemy = spawn_enemy(test_enemy, spawn_vec)
		print(enemy)

func spawn_enemy(enemy:PackedScene, spawn_position:Vector3) -> Node:
	var enemy_instance = enemy.instantiate()
	NodePaths.dynamic_scene_path.add_child(enemy_instance)
	print(enemy_instance)
	var enemy_entity:EnemyEntity = enemy_instance as EnemyEntity
	enemy_entity.get_main_object().global_position = spawn_position
	return enemy_instance
