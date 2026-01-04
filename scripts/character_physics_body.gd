extends CharacterBody3D
class_name CharacterPhysicsBody3D

@export var mass:float = 1

func add_force(force:Vector3) -> void:
	velocity += force / mass

func set_only_force(force:Vector3) -> void:
	velocity = Vector3.ZERO
	velocity += force / mass
