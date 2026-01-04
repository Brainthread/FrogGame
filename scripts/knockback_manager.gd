extends Node3D
class_name KnockbackHandler

@export var body:CharacterPhysicsBody3D

func _ready() -> void:
	get_parent().took_knockback.connect(on_take_knockback)

func on_take_knockback (force:Vector3) -> void:
	body.add_force(force)
	print("knockback applied")
