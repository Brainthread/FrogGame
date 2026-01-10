extends State
class_name MosquitoHuntState


@export var aggro_manager:AggroManager
@export var nav:NavigationAgent3D
@export var body:CharacterBody3D
@export var movement_speed:float = 2
@export var acceleration:float = 1.5
@export var deceleration:float = 5
var movement_direction:Vector3

@export var attack_range:float = 1

@export var attack_state:State


func _enter_state() -> void:
	_set_nav_target()

func _set_nav_target() -> void:
	while true:
		await get_tree().create_timer(randf_range(0.3, 3)).timeout;
		nav.target_position = aggro_manager.target.global_position

func _state_update(delta: float) -> void:
	var target_distance = aggro_manager.target.global_position.distance_to(self.global_position)
	if  target_distance < attack_range:
		state_machine._change_state(attack_state)
		print("Mosquito knight: ATTACKING")


func _state_physics_update(delta: float) -> void:
	var destination = nav.get_next_path_position()
	var local_destination = destination - body.global_position
	var direction = local_destination.normalized()
	
	movement_direction = direction
	var direction_dot = body.velocity.dot(direction)
	var acceleration_parameter = acceleration if direction_dot > 0 else deceleration 
	
	var yvel = body.velocity.y
	body.velocity = body.velocity.move_toward(movement_direction*movement_speed, delta*acceleration_parameter)
	yvel -= 9.82*delta
	body.velocity.y = yvel
	body.move_and_slide()
