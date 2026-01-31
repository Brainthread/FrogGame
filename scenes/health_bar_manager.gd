extends Control
class_name HealthBarManager

var health_maximum
var health_actual
var health_display

@export var damage_bar:ProgressBar
@export var health_bar:ProgressBar

# Called when thh node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
