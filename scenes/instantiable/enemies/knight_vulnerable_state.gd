class_name KnightVulnerableState extends State

@export var fallback_state:State
var weak_stagger_time:float = 0.01

var stagger_time:float = 1

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	super._initialize_state(state_machine_node, root_node)

func _enter_state():
	super._enter_state()

func _exit_state():
	super._exit_state()

func _state_physics_update(_delta: float):
	super._state_physics_update(_delta)

func _state_update(_delta: float):
	super._state_update(_delta)
