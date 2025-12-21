extends State
class_name PlayerTongueAttackLight


func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node

func _enter_state():
	super._enter_state()
	pass

func _exit_state():
	super._exit_state()
	pass

func _state_update(_delta: float): 
	pass


func _state_physics_update(_delta: float):
	pass
