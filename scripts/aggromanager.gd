extends Node3D
class_name AggroManager

var target:Node3D = null
var target_request_cooldown = 0.3

signal requested_player_target(requester:AggroManager)

func _process(delta: float) -> void:
	target_request_cooldown = move_toward(target_request_cooldown, 0, delta)
	if target == null && target_request_cooldown <= 0:
		requested_player_target.emit(self as AggroManager)
		target_request_cooldown = randf_range(0.3, 5)

func receive_player_target(player_node:Node3D):
	target = player_node
