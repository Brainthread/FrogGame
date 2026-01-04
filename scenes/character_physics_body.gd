extends CharacterBody3D
class_name CharacterPhysicsBody3D

@export var mass:float = 1

func add_velocity(value:Vector3) -> void:
	velocity += value / mass
