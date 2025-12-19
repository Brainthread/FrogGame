extends State
class_name PlayerTongueAttackState

@export var jump_state:PlayerJumpState
@export var airborne_state:PlayerAirborneState
@export var ground_state:PlayerGroundState

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node

func _enter_state():
	pass
	
func _start_attack():
	pass

func _exit_state():
	pass

func _state_update(_delta: float):
	pass

func hit_object(object):
	pass

func apply_damage(hurtbox):
	pass

func set_hitbox_rotation():
	pass

func set_slash_rotation():
	pass

func start_registering_hits ():
	pass

func stop_registering_hits ():
	pass

func _state_physics_update(_delta: float):
	pass
