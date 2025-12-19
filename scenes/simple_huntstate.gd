extends Node3D

@export var player:Node3D
@export var nav:NavigationAgent3D
@export var body:CharacterBody3D

func _process(delta: float) -> void:
	nav.target_position = player.position


func _physics_process(delta: float) -> void:
	var destination = nav.get_next_path_position()
	var local_destination = destination - global_position
	var direction = local_destination.normalized()
	
	body.velocity = direction * 5.0
	body.move_and_slide()
