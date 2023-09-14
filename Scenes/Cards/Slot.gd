extends Area2D

var tag = null
var type = null
var sprite = null
var qty = -1


func _ready():
	print(sprite)
	if qty != -1: $Qty.text = "x" + str(qty)
	else: $Qty.text = ""
	$Tag.text = tag


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and qty == -1:
		if event.is_action_pressed("left_mb"):
			print(type)
			print(sprite)
			print(tag)
			var item = load(type).instantiate()
			item.get_node("Sprite2D").set_texture(load(sprite))
			item.tag = tag
			item.position = get_viewport().get_mouse_position()
			get_parent().add_child(item)
			queue_free()
			# Input.action_press("left_mb")
