extends Area2D


var grab = 0
var tag = "Axe"
var cooldown = false
var cooldown_time = 3
var can_move = false
var dragging = false
var old = null
var put_down = false
var saved_body = null
var stats = {"strength": 3}


func _process(delta):
	if saved_body != null and not dragging:
		position = saved_body.position
		if position == saved_body.position:
			saved_body.get_node("Sprite2D").visible = false
	if can_move:
		move_to_front()
		position = get_viewport().get_mouse_position() - grab
		position.x = clamp(position.x, 0, 1366)
		position.y = clamp(position.y, 0, 768)
		var mouse_pos = get_viewport().get_mouse_position()
		var window_size = get_viewport().size
		if mouse_pos.x <= 0 or mouse_pos.x >= window_size.x or mouse_pos.y <= 0 or mouse_pos.y >= window_size.y:
			Input.action_release("left_mb")
			on_lmb_released()
		if position.x != old.x or position.y != old.y and dragging == false:
			dragging = true
	if cooldown:
		cooldown_time -= delta
		if cooldown_time <= 0:
			cooldown = false
			cooldown_time = 3


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_mb"):
			on_lmb_pressed()
		elif event.is_action_released("left_mb"):
			on_lmb_released()
		elif event.is_action_pressed("right_mb"):
			on_rmb_pressed()
		elif event.is_action_released("right_mb"):
			on_rmb_released()


func on_lmb_pressed():
	put_down = false
	can_move = true
	move_to_front()
	$Sprite2D.scale.x = 0.32 + 0.017
	$Sprite2D.scale.y = 0.32 + 0.017
	grab = get_viewport().get_mouse_position() - position
	old = position
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/up.mp3")
	$AudioStreamPlayer2D.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func on_lmb_released():
	put_down = true
	can_move = false
	dragging = false
	$Sprite2D.scale.x = 0.32
	$Sprite2D.scale.y = 0.32
	if saved_body != null:
		if not saved_body.died():
			damage_body(saved_body)
		else:
			var me = inventory.generate_item(tag, 
											 $Sprite2D.texture.resource_path,
											 -1, "tool", stats)
			inventory.add_item(me, -1)
			queue_free()
	else:
		$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/down.mp3")
		$AudioStreamPlayer2D.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func on_rmb_pressed():
	$Sprite2D.scale.x = 0.32 + 0.017
	$Sprite2D.scale.y = 0.32 + 0.017
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/up.mp3")
	$AudioStreamPlayer2D.play()


func on_rmb_released():
	$Sprite2D.scale.x = 0.32
	$Sprite2D.scale.y = 0.32
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stream = load("res://Sounds/Inventory/put.mp3")
	$AudioStreamPlayer2D.play()
	var me = inventory.generate_item(tag, $Sprite2D.texture.resource_path, 
									 -1, "tool", stats)
	inventory.add_item(me, -1)
	visible = false


func damage_body(body):
	body.hit(stats["strength"])
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/Tools/Axe/Hit.mp3")
	$AudioStreamPlayer2D.play()


func _on_area_entered(area):
	if area.get("tag") and saved_body == null:
		if area.tag == "Tree":
			area.get_node("Sprite2D").visible = false
			saved_body = area
			print("Tree entered")


func _on_area_exited(area):
	if area.get("tag") and saved_body != null:
		if area.tag == "Tree":
			area.get_node("Sprite2D").visible = true
			saved_body = null
			print("Tree exited")


func _on_mouse_entered():
	if not cooldown:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_WAIT)


func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_audio_stream_player_2d_finished():
	if $AudioStreamPlayer2D.stream.resource_path == "res://Sounds/Inventory/put.mp3":
		queue_free()
