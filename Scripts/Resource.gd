extends CharacterBody2D


var grab = null

var tag = "Log"
var cooldown = false
var cooldown_time = 3
var can_move = false
var dragging = false
var stats = null
var old = null

var put_down = false


func _process(delta):
	$Tag.text = tag
	
	if can_move:
		move_to_front()
		position = get_viewport().get_mouse_position() - grab
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
			put_down = false
			can_move = true
			$Sprite2D.scale.x += 0.017
			$Sprite2D.scale.y += 0.017
			grab = get_viewport().get_mouse_position() - position
			old = position
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			$AudioStreamPlayer2D.stop()
			$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/up.mp3")
			$AudioStreamPlayer2D.play()
		elif event.is_action_released("left_mb"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			var me = inventory.generate_item(tag, $Sprite2D.texture.resource_path, 1, "resource", null)
			inventory.add_item(me, 1)
			$AudioStreamPlayer2D.stop()
			$AudioStreamPlayer2D.stream = load("res://Sounds/Inventory/put.mp3")
			$AudioStreamPlayer2D.play()
			visible = false


func _on_Area2D_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_Area2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_audio_stream_player_2d_finished():
	if $AudioStreamPlayer2D.stream.resource_path == "res://Sounds/Inventory/put.mp3":
		queue_free()
