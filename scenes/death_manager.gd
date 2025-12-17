extends Node3D
class_name DeathManager

func die():
	get_parent().get_parent().queue_free()
