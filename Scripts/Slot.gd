extends Area2D

var tag = null # item tag or item ID
var type = null # item type (tool, resource or location)
var sprite = null # item sprite
var qty = -1 #item quantity (-1 == unstackable)
var stats = null # item stats


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
			var item = load(type).instantiate()
			item.get_node("Sprite2D").set_texture(load(sprite))
			# item configuration
			item.tag = tag
			item.stats = stats
			item.position = get_viewport().get_mouse_position()
			# add the item to the "Cards" node:
			get_tree().get_root().get_node("Main").get_node("Cards").add_child(item)
			# remove the item from player's inventory:
			inventory.take_item(inventory.generate_item(tag, sprite, qty, type), -1)
			queue_free() # remove slot
			# auto card grabbing:
			Input.action_press("left_mb")
			item.on_lmb_pressed()


func _on_mouse_entered():
	$Tag.visible = true
	scale = Vector2(scale.x + 0.055, scale.y + 0.055) # "animation"
	# get all slot sounds:
	var sounds = []
	var i = 1
	while i < 4:
		sounds.append("res://Sounds/Inventory/Slots/select_%s.wav" % i)
		i += 1
	var stream = utils.random_choice(sounds) # get random sound
	$AudioStreamPlayer.stream = load(stream)
	$AudioStreamPlayer.play()
	if qty == -1: # if the item is stackable
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)


func _on_mouse_exited():
	$Tag.visible = false
	scale = Vector2(scale.x - 0.055, scale.y - 0.055) # "animation"
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
