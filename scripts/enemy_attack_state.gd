extends State
class_name MosquitoAttackState

@export var aggro_manager:AggroManager
@export var hitbox:Hitbox
@export var windup_time:float = 0.6
@export var attack_time:float = 0.3
@export var next_state:State
@export var attack_deceleration:float = 10
@export var bounce_deceleration:float = 5
@export var attack_velocity:float = 10
var registering = false
var attack_direction:Vector3

func _enter_state():
	is_active = true
	attack_direction = (aggro_manager.target.global_position - root.global_position).normalized()
	await get_tree().create_timer(windup_time).timeout
	registering = true
	root.add_force(attack_direction*attack_velocity)
	await get_tree().create_timer(attack_time).timeout
	state_machine._change_state(next_state)

func _exit_state():
	registering = false
	is_active = false

func _state_update(_delta: float):
	if registering:
		pass
	else:
		pass

func _state_physics_update(_delta: float):
	root.velocity = root.velocity.move_toward(Vector3.ZERO, _delta*attack_deceleration)
	root.move_and_slide()
