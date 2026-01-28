extends Node
class_name GameEntity

@onready var main_object:Node3D = self.get_child(0)

func _enter_tree():
	main_object = self.get_child(0)

func get_main_object() -> Node3D:
	return main_object
