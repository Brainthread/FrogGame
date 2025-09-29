extends Node

var movement_vector:Vector2
var joystick:bool = false
signal on_press_button

func _process(_delta:float) -> void:
	movement_vector = Input.get_vector("right", "left", "up", "down")
	

func _get_attack_direction(object):
	if joystick:
		return null
	else:
		return _get_mouse_object_offset(object)

func _get_object_screen_position(object) -> Vector2:
	var vp = get_viewport()
	var cam = vp.get_camera_3d()
	if cam and object:
		var screen_pos = cam.unproject_position(object.global_transform.origin)
		return screen_pos
	return Vector2(NAN, NAN)

func _get_mouse_object_offset(object) -> Vector2:
	var screen_pos = _get_object_screen_position(object)
	var mouse_position = get_viewport().get_mouse_position();
	var diff = screen_pos - mouse_position;
	print(diff);
	return diff.normalized()
	
	

func _pressed_button(_button) -> void:
	on_press_button.emit()
	pass
