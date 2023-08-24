extends KinematicBody2D


var grab_x = 0
var grab_y = 0

var id = "axe"
var cooldown = false
var cooldown_time = 3
var can_move = false
var dragging = false

var old_x = 0
var old_y = 0

var put_down = false

func _process(delta):
	if can_move:
		position.x = get_viewport().get_mouse_position().x - grab_x
		position.y = get_viewport().get_mouse_position().y - grab_y
		position.x = clamp(position.x, 0, 1366)
		position.y = clamp(position.y, 0, 768)
		if position.x != old_x or position.y != old_y:
			dragging = true
	if cooldown:
		cooldown = false
		return
		cooldown_time -= delta
		if cooldown_time == 0:
			cooldown_time = 3
			cooldown = false
	


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			$Sprite.scale.x = 0.32 + 0.017
			$Sprite.scale.y = 0.32 + 0.017
			grab_x = get_viewport().get_mouse_position().x - position.x
			grab_y = get_viewport().get_mouse_position().y - position.y
			old_x = position.x
			old_y = position.y
			put_down = false
			can_move = true
		elif not event.pressed and event.button_index == 1:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Sprite.scale.x = 0.32
			$Sprite.scale.y = 0.32
			put_down = true
			can_move = false
			dragging = false


