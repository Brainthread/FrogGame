extends Node3D

var usable:bool = false
var tongue_state:TongueState = TongueState.WAITING
var tongue_target:Node3D = null
var tongue_target_position:Vector3
@export var max_length:float = 1
@export var extension_speed:float = 10
@export var retraction_speed:float = 7
@export var fall_to_floor_speed:float = 0.5
@export var tongue_tip_node:Node3D


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
				var cam = get_viewport().get_camera_3d()
				var ray_origin = InputReader.get_mouse_world_origin(cam)
				var ray_normal = InputReader.get_mouse_world_normal(cam)
				var space_state = get_world_3d()
				var ray_end = ray_origin + ray_normal * 100
				var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
				query.collide_with_areas = true
				query.collide_with_bodies = true
				var result = space_state.intersect_ray(query)
				
				
		TongueState.EXTENDING:
			_test_for_retracting()
		TongueState.RETRACTING:
			if tongue_tip_node.position.distance_to(self.position) < 0.01:
				tongue_state = TongueState.WAITING
			else:
				tongue_tip_node.position = tongue_tip_node.position.move_toward(self.position, delta*retraction_speed) 
		TongueState.FALLING:
			_test_for_retracting()
		TongueState.ATTACHED:
			_test_for_retracting()

func _test_for_retracting():
	if Input.is_action_just_released("tongue_attack"):
		tongue_state = TongueState.RETRACTING

func _start_retracting():
	tongue_state = TongueState.RETRACTING
