extends State
class_name PlayerGroundAttackState

@export var attack_substates = null
@export var slice_movement_force:float = 5
@export var attack_time:float = 0.5
var attack_timer = 0
@export var slice_movement_curve:Curve
var attack_direction:Vector3
@export var slash_hitbox:Node3D
@export var slash_fx:Node3D

@export var jump_state:PlayerJumpState
@export var airborne_state:PlayerAirborneState
@export var ground_state:PlayerGroundState

func _initialize_state(state_machine_node:FiniteStateMachine, root_node:Node):
	state_machine = state_machine_node
	root = root_node
	slash_hitbox.hit_entity.connect(hit_object)
	slash_fx.visible = false;

func _enter_state():
	var attack_direction_2D = InputReader._get_attack_direction(root)
	attack_direction.x = attack_direction_2D.y * -1
	attack_direction.z = attack_direction_2D.x
	attack_timer = 0
	root.velocity = Vector3.ZERO
	root.move_and_slide()
	start_registering_hits()
	slash_fx.visible = true;

func _exit_state():
	stop_registering_hits()
	slash_fx.visible = false;

func _state_update(_delta: float):
	var vel = Vector3.ZERO
	vel = slice_movement_curve.sample(attack_timer/attack_time) * attack_direction * slice_movement_force
	root.velocity = vel
	attack_timer += _delta
	if attack_timer >= attack_time:
		attack_timer = 0
		if state_machine._is_grounded():
			state_machine._change_state(ground_state)
		else:
			state_machine._change_state(airborne_state)
	root.move_and_slide()

func hit_object(object):
	var hurtbox = object
	if hurtbox.verify_hit():
		apply_damage(hurtbox)

func apply_damage(hurtbox):
	print("hit: " + hurtbox.name)
	hurtbox.apply_damage(10);

func set_hitbox_rotation():
	var dir:Vector2 = Vector2(attack_direction.z, attack_direction.x)
	var angle = -atan2(dir.x, dir.y)
	slash_hitbox.rotation = Vector3(slash_hitbox.rotation.x, angle, slash_hitbox.rotation.z)

func set_slash_rotation():
	var dir:Vector2 = Vector2(attack_direction.z, attack_direction.x)
	var angle = -atan2(dir.x, dir.y)
	slash_fx.rotation = Vector3(slash_fx.rotation.x, angle, slash_fx.rotation.z)

func start_registering_hits ():
	set_hitbox_rotation()
	set_slash_rotation()
	slash_hitbox.start_detecting_hits();

func stop_registering_hits ():
	slash_hitbox.stop_detecting_hits();

func _state_physics_update(_delta: float):
	pass
