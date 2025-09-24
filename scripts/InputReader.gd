extends Node

var movement_vector:Vector2
var joystick:bool = false
signal on_press_button

func _process(_delta:float) -> void:
	movement_vector = Input.get_vector("right", "left", "up", "down")
	

func _get_attack_direction():
	if joystick:
		pass
	else:
		_get_relative_screen_position(null, null)

func _get_relative_screen_position(camera, object_position) -> Vector3:
	return Vector3(NAN, NAN, NAN)
	
	

func _pressed_button(_button) -> void:
	on_press_button.emit()
	pass
