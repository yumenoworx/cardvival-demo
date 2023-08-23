extends KinematicBody2D


var grab_x = 0
var grab_y = 0

var dragging = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Haiii^^")


func _on_KinematicBody2D_mouse_entered():
	print("haiii")


func _process(delta):
	if dragging == true:
		position.x = get_viewport().get_mouse_position().x - grab_x
		position.y = get_viewport().get_mouse_position().y - grab_y
		position.x = clamp(position.x, 0, 1366)
		position.y = clamp(position.y, 0, 768)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			$Sprite.scale.x = 0.32 + 0.017
			$Sprite.scale.y = 0.32 + 0.017
			grab_x = get_viewport().get_mouse_position().x - position.x
			grab_y = get_viewport().get_mouse_position().y - position.y
			dragging = true
		elif not event.pressed and event.button_index == 1:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Sprite.scale.x = 0.32
			$Sprite.scale.y = 0.32
			dragging = false
