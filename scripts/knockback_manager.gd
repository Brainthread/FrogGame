extends Node3D
class_name KnockbackHandler

@export var body:CharacterPhysicsBody3D

func _ready() -> void:
	get_parent().took_knockback.connect(on_take_knockback)

func on_take_knockback (force:Vector3) -> void:
	var current_velocity:Vector3 = body.velocity;
	var mass = body.mass;
	var target_velocity = force/mass
	var diff = target_velocity - current_velocity
	var force_to_add;
	force_to_add = clamp(diff*mass, -force, force)
	body.add_force(force_to_add)
	print("knockback applied: ", force_to_add, ":", target_velocity, ":", current_velocity)
