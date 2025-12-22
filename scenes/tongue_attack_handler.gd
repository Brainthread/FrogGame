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
	RETRACTING,
	FALLING,
	ATTACHED
}

signal attached(target:Node3D, position:Vector3)

func _process(delta: float) -> void:
	if not usable:
		_start_retracting()
	match tongue_state:
		TongueState.WAITING:
			if Input.is_action_just_pressed("tongue_attack"):
				tongue_state = TongueState.EXTENDING
		TongueState.EXTENDING:
			if Input.is_action_just_released("tongue_attack"):
				tongue_state = TongueState.RETRACTING
		TongueState.RETRACTING:
			if tongue_hitbox.position.distance_to(self.position) < 0.01:
				tongue_state = TongueState.WAITING
			else:
				pass
		TongueState.FALLING:
			if Input.is_action_just_released("tongue_attack"):
				tongue_state = TongueState.RETRACTING
		TongueState.ATTACHED:
			if Input.is_action_just_released("tongue_attack"):
				tongue_state = TongueState.RETRACTING

func _start_retracting():
	tongue_state = TongueState.RETRACTING
