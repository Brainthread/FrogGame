extends Node3D
class_name EffectManager

@export var body:CharacterPhysicsBody3D
@export var hurtbox:Hurtbox

func _ready() -> void:
	hurtbox.received_effects.connect(_handle_effects)

func _handle_effects(effects:Dictionary) -> void:
	for effect in effects:
		match effect:
			"knockback":
				_apply_knockback(effects[effect])
				pass

func _apply_knockback(velocity:Vector3) -> void:
	body.add_velocity(velocity)
	print("knockback applied")
