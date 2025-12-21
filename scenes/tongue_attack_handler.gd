extends Node3D

var usable:bool = false
var tongue_state:TongueState = TongueState.WAITING
var tongue_target:Node3D = null
@export var max_length:float = 1
@export var extension_speed:float = 1
@export var fall_to_floor_speed:float = 0.5
@export var tongue_hitbox:Hitbox


enum TongueState {
	WAITING,
	EXTENDING,
	FALLING,
	ATTACHED
}

signal attached(target:Node3D, position:Vector3)

func _process(delta: float) -> void:
	match tongue_state:
		TongueState.WAITING:
			pass
		TongueState.EXTENDING:
			pass
		TongueState.FALLING:
			pass
		TongueState.ATTACHED:
			pass
