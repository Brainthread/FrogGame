extends GameEntity
class_name PlayerEntity

@export_group("System scripts")
@export var health_manager:HealthManager
@export var death_manager:DeathManager
@export var state_machine:FrogStateMachine

@export_subgroup("States")
@export var state_grounded:PlayerGroundState
@export var state_attack:PlayerGroundAttackState
@export var state_tongue_attack:PlayerTongueAttackState
@export var state_airborne:PlayerAirborneState
@export var state_jump:PlayerJumpState
@export_subgroup("")

@export var effect_manager:EffectManager

@export_group("Subsystems")
@export var hurtbox:Hurtbox

func _enter_tree():
	hurtbox.took_damage.connect(health_manager.apply_damage)
	health_manager.depleted_health.connect(death_manager.die)
