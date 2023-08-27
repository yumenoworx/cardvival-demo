extends KinematicBody2D


var grab_x = 0
var grab_y = 0

var id = "log"
var cooldown = false
var cooldown_time = 3
var can_move = false
var dragging = false

var old_x = 0
var old_y = 0

var put_down = false

func _process(delta):
	$id.text = id
	if can_move:
		position.x = get_viewport().get_mouse_position().x - grab_x
		position.y = get_viewport().get_mouse_position().y - grab_y
		if position.x != old_x or position.y != old_y and dragging == false:
			dragging = true
	if cooldown:
		cooldown_time -= delta
		if cooldown_time <= 0:
			cooldown = false
			cooldown_time = 3


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_mb"):
			put_down = false
			can_move = true
			$Sprite.scale.x = 0.32 + 0.017
			$Sprite.scale.y = 0.32 + 0.017
			grab_x = get_viewport().get_mouse_position().x - position.x
			grab_y = get_viewport().get_mouse_position().y - position.y
			old_x = position.x
			old_y = position.y
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		if event.is_action_released("left_mb"):
			put_down = true
			can_move = false
			dragging = false
			$Sprite.scale.x = 0.32
			$Sprite.scale.y = 0.32
			queue_free()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Area2D_mouse_entered():
	if not cooldown:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_WAIT)


func _on_Area2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
