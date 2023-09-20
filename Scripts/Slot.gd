extends Area2D

var tag = null
var type = null
var sprite = null
var qty = -1
var stats = null


func _ready():
	print(sprite)
	$Tag.visible = false
	if qty != -1: $Qty.text = "x" + str(qty)
	else: $Qty.text = ""
	$Tag.text = tag


func _process(delta):
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
			item.stats = stats
			item.position = get_viewport().get_mouse_position()
			get_tree().get_root().get_node("Main").get_node("Cards").add_child(item)
			inventory.take_item(inventory.generate_item(tag, sprite, qty, type), -1)
			queue_free()
			Input.action_press("left_mb")
			item.on_lmb_pressed()


func _on_mouse_entered():
	$Tag.visible = true
	scale.x += 0.011
	scale.y += 0.011
	var sounds = []
	var i = 1
	while i < 4:
		sounds.append("res://Sounds/Inventory/Slots/select_%s.wav" % i)
		i += 1
	var stream = utils.random_choice(sounds)
	$AudioStreamPlayer.stream = load(stream)
	$AudioStreamPlayer.play()
	if qty == -1:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)


func _on_mouse_exited():
	$Tag.visible = false
	scale.x -= 0.011
	scale.y -= 0.011
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
