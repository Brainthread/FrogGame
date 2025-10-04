extends State
class_name PlayerJumpState

@export var airborne_state:PlayerAirborneState
@export var grounded_state:PlayerGroundState
@export var jump_power:int = 15

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node

func _enter_state():
	is_active = true
	root.velocity.y = jump_power
	root.move_and_slide()

func _exit_state():
	is_active = false
	pass

func _state_update(_delta: float):
	state_machine._change_state(airborne_state)
	pass

func _state_physics_update(_delta: float):
	pass
