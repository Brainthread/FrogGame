extends State
class_name PlayerGroundAttackState

@export var attack_substates = null
@export var slice_movement_force:float = 5
@export var attack_time:float = 0.5
var attack_timer = 0
@export var slice_movement_curve:Curve
var attack_direction:Vector3

@export var jump_state:PlayerJumpState
@export var airborne_state:PlayerAirborneState
@export var ground_state:PlayerGroundState

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node

func _enter_state():
	attack_direction = Vector3(1, 0, 1)
	attack_timer = 0
	root.velocity = Vector3.ZERO
	root.move_and_slide()

func _exit_state():
	pass

func _state_update(_delta: float):
	var vel = Vector3.ZERO;
	vel = slice_movement_curve.sample(attack_timer/attack_time) * attack_direction * slice_movement_force
	root.velocity = vel;
	attack_timer += _delta
	
	if attack_timer >= attack_time:
		attack_timer = 0
		if state_machine._is_grounded():
			state_machine._change_state(ground_state)
		else:
			state_machine._change_state(airborne_state)
	root.move_and_slide()
	

func _state_physics_update(_delta: float):
	pass
