extends GameEntity
class_name EnemyEntity

@export var aggro_manager:AggroManager

signal requested_player_target(aggro_manager_instance:AggroManager)

func _ready():
	aggro_manager.requested_player_target.connect(_on_requested_player_target)

func _on_requested_player_target(aggro_manager_instance:AggroManager):
	requested_player_target.emit(aggro_manager_instance)
	print("EnemyEntity: Request received")
