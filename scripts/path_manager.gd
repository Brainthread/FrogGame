extends Node3D

@export var dynamic_scene_node:Node3D
@export var effect_scene_node:Node3D

func _enter_tree() -> void:
	NodePaths.dynamic_scene_path = dynamic_scene_node
	NodePaths.effect_path = effect_scene_node
