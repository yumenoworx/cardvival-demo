extends Area2D
var pcursor = Input.get_current_cursor_shape()

func _ready():
	modulate.a = 0.5


func _on_mouse_entered():
	modulate.a = 1
	pcursor = Input.get_current_cursor_shape()
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_mouse_exited():
	modulate.a = 0.5
	Input.set_default_cursor_shape(pcursor)


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_mb"):
		if not randi()%18:
			OS.shell_open("https://t.me/natsunokaze")
			OS.shell_open("https://youtu.be/dQw4w9WgXcQ?si=37y7BE-Hp8Bi8Swc")
		else:
			OS.shell_open("https://t.me/natsunokaze")

