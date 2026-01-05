extends Node3D

@export var health_manager:HealthManager
@export var hurtbox:Hurtbox
@export var death_manager:DeathManager

func _ready() -> void:
	hurtbox.took_damage.connect(health_manager.apply_damage)
	health_manager.depleted_health.connect(death_manager.die)
