extends Node3D

@export var player:Node3D
@export var nav:NavigationAgent3D
@export var body:CharacterBody3D

func _ready() -> void:
	_set_nav_target()

func _set_nav_target() -> void:
	while true:
		await get_tree().create_timer(randf_range(0.3, 3)).timeout;
		nav.target_position = player.position

func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	var destination = nav.get_next_path_position()
	var local_destination = destination - global_position
	var direction = local_destination.normalized()
	
	body.velocity = direction * 2.0
	body.move_and_slide()
