extends Node3D
class_name Hurtbox

var is_active: bool = false
signal took_damage

func _ready() -> void:
	pass
	
func verify_hit() -> bool:
	return true
	
func apply_damage(damage) -> void:
	took_damage.emit(damage);
	print("Took damage: " + str(damage))
