extends State
class_name PlayerGroundState

@export var movement_speed:float = 5
var movement_vector:Vector3
@export var acceleration:float = 10
@export var deceleration:float = 10
@export var g:float = -9.82
var jump_timer = 0;
@export var jump_state:PlayerJumpState
@export var airborne_state:PlayerAirborneState

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node

func _enter_state():
	jump_timer = 0
	is_active = true
	pass

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
	if Input.is_action_pressed("jump"):
		jump_timer += _delta
	if Input.is_action_just_released("jump"):
		state_machine._change_state(jump_state)
		
	if not state_machine._is_grounded():
		state_machine._change_state(airborne_state)
	
	var input_vector = Vector3(ud, 0, lr).normalized()
	var horizontal_velocity = root.velocity
	horizontal_velocity.y = 0
	horizontal_velocity = lerp(horizontal_velocity, input_vector * movement_speed, _delta * acceleration)
	var new_velocity = horizontal_velocity
	new_velocity.y = root.velocity.y + g * _delta

	root.velocity = new_velocity
	root.move_and_slide()

	

func _state_physics_update(_delta: float):
	pass
