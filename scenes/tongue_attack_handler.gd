extends Node3D

var usable:bool = false
@export var max_length:float = 1
@export var extension_speed:float = 1
@export var fall_to_floor_speed:float = 0.5

enum toungue_state {
	WAITING,
	EXTENDING,
	ATTACHED_GROUND
}

signal attached(target:Node3D, position:Vector3)
