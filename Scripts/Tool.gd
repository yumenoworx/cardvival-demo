extends CharacterBody2D


var grab_x = 0
var grab_y = 0

var tag = "Axe"
var cooldown = false
var cooldown_time = 3
var can_move = false
var dragging = false

var old = null

var put_down = false

func _ready():
	print(tag)
	
func _process(delta):
	if can_move:
		position.x = get_viewport().get_mouse_position().x - grab_x
		position.y = get_viewport().get_mouse_position().y - grab_y
		position.x = clamp(position.x, 0, 1366)
		position.y = clamp(position.y, 0, 768)
		if position.x != old.x or position.y != old.y and dragging == false:
			dragging = true
	if cooldown:
		cooldown_time -= delta
		if cooldown_time <= 0:
			cooldown = false
			cooldown_time = 3


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_mb"):
			on_pressed()
		if event.is_action_released("left_mb"):
			on_realesed()


func on_pressed():
	put_down = false
	can_move = true
	move_to_front()
	$Sprite2D.scale.x = 0.32 + 0.017
	$Sprite2D.scale.y = 0.32 + 0.017
	grab_x = get_viewport().get_mouse_position().x - position.x
	grab_y = get_viewport().get_mouse_position().y - position.y
	old = position
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func on_realesed():
	put_down = true
	can_move = false
	dragging = false
	$Sprite2D.scale.x = 0.32
	$Sprite2D.scale.y = 0.32
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Area2D_mouse_entered():
	if not cooldown:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_WAIT)


func _on_Area2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
