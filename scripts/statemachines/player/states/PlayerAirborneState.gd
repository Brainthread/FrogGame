extends State
class_name PlayerAirborneState

@export var grounded_state:PlayerGroundState
@export var movement_speed:float = 4
@export var acceleration:float = 2

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node

func _enter_state():
	is_active = true

func _exit_state():
	is_active = false
	pass

func _state_update(_delta: float):
	var lr = 0
	var ud = 0
	if Input.is_action_pressed("left"):
		lr += 1
	if Input.is_action_pressed("right"):
		lr -= 1
	if Input.is_action_pressed("up"):
		ud -= 1
	if Input.is_action_pressed("down"):
		ud += 1
	
	var input_vector = Vector3(ud, 0, lr).normalized()
	var horizontal_velocity = root.velocity
	
	horizontal_velocity.y = 0
	horizontal_velocity = lerp(horizontal_velocity, input_vector * movement_speed, _delta * acceleration)
	
	var new_velocity = horizontal_velocity
	new_velocity.y = root.velocity.y;
	
	if root.velocity.y > 0:
		new_velocity.y += state_machine.g_on_rise * _delta
	if root.velocity.y <= 0:
		new_velocity.y += state_machine.g_on_fall * _delta
		if(state_machine._is_grounded()):
			state_machine._change_state(grounded_state)
	
	root.velocity = new_velocity
	root.move_and_slide()

func _state_physics_update(_delta: float):
	pass
