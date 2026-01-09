extends State
class_name MosquitoAttackState

@export var hitbox:Hitbox
@export var windup_time:float = 0.6


func _enter_state():
	is_active = true
	pass

func _exit_state():
	is_active = false
	pass

func _state_update(_delta: float):
	pass

func _state_physics_update(_delta: float):
	pass
