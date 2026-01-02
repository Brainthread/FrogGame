extends Hurtbox
class_name DraggableHurtbox

@export var is_heavy: bool = false
signal started_being_dragged(dragger) 
signal stopped_being_dragged

func _ready() -> void:
	super._ready()
	
func verify_hit() -> bool:
	return super.verify_hit()
	
func apply_damage(damage) -> void:
	super.apply_damage(damage)

func start_dragging(dragger) -> void:
	started_being_dragged.emit(dragger)
	print(name, ": being dragged")

func stop_dragging() -> void:
	stopped_being_dragged.emit()
	print(name, ": stopped being dragged")
