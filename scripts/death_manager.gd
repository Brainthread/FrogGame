extends Node3D
class_name DeathManager

func die():
	print(get_parent().get_parent().name, " died. ")
	get_parent().get_parent().queue_free()


func _on_water_splash_manager_exited_water() -> void:
	die()
