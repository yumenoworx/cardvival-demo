extends Area2D
var pcursor = Input.get_current_cursor_shape()

func _on_mouse_entered():
	pcursor = Input.get_current_cursor_shape()
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_mouse_exited():
	Input.set_default_cursor_shape(pcursor)


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_mb"):
		OS.shell_open("https://t.me/natsunokaze")

