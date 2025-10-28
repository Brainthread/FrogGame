extends Area3D
class_name Hitbox

var is_active: bool = false
var hits: Dictionary = {}
signal hit_entity

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	self.area_entered.connect(_on_area_entered)

func start_detecting_hits() -> void:
	is_active = true
	hits.clear()

func stop_detecting_hits() -> void:
	is_active = false

func _process(_delta: float) -> void:
	if is_active:
		detect_hit()

func detect_hit() -> void:
	var overlapping_bodies = get_overlapping_bodies()
	var overlapping_areas = get_overlapping_areas()

	for body in overlapping_bodies:
		if body not in hits:
			hits[body] = true
			hit_entity.emit(body)

	for area in overlapping_areas:
		if area not in hits:
			hits[area] = true
			hit_entity.emit(area)

func _on_body_entered(body: Node) -> void:
	if is_active && body not in hits:
		hits[body] = true
		hit_entity.emit(body)

func _on_area_entered(area: Area3D) -> void:
	if is_active && area not in hits:
		hits[area] = true
		hit_entity.emit(area)
