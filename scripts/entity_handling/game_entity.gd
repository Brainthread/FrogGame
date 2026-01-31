extends Node
class_name GameEntity

@onready var main_object:Node3D = self.get_child(0)

func _enter_tree():
	main_object = self.get_child(0)

func get_global_position() -> Vector3:
	return main_object.global_position

func get_global_rotation() -> Vector3:
	return main_object.global_rotation

func set_global_position(global_position:Vector3):
	main_object.global_position = global_position

func set_global_rotation(global_rotation:Vector3):
	main_object.global_rotation = global_rotation

func get_main_object() -> Node3D:
	return main_object
