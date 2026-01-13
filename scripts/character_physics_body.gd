extends CharacterBody3D
class_name CharacterPhysicsBody3D

@export var mass:float = 1
var external_velocity:Vector3

func add_force(force:Vector3) -> void:
	velocity += force / mass

func set_only_force(force:Vector3) -> void:
	velocity = force/mass;

func add_external_force(force:Vector3) -> void:
	external_velocity += force/mass

func set_only_external_force(force:Vector3) -> void:
	external_velocity = force/mass;
