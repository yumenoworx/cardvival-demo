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


func _process(delta):
	$Tag.visible = false
	if inventory.inventory != inventory.old_inventory:
		queue_free()


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
			get_tree().get_root().get_node("Main").get_node("Cards").add_child(item)
			inventory.take_item(inventory.generate_item(tag, sprite, qty, type), -1)
			queue_free()
			Input.action_press("left_mb")
			item.on_lmb_pressed()


func _on_mouse_entered():
	$Tag.visible = true
	if qty == -1:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)


func _on_mouse_exited():
	$Tag.visible = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
