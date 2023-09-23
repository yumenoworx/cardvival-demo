extends CharacterBody2D


var tag = "Forest" # or card ID
var type = "location" # item type
var can_move = false # can the item be taken by the player? hmmm...
var dragging = false # has the card moved even a pixel?
var stats = null # item stats
var old = null # old position of the card to determine its movement
var put_down = false # whether the card is put down or not?
var grab = null # card grab position

func _ready():
	print(tag)

func _process(_delta):
	if can_move:
		move_to_front()
		position = get_viewport().get_mouse_position() - grab
		var mouse_pos = get_viewport().get_mouse_position()
		var window_size = global.resolution
		position.x = clamp(position.x, 0, window_size.x)
		position.y = clamp(position.y, 0, window_size.y)
		if mouse_pos.x <= 0 or mouse_pos.x >= window_size.x or mouse_pos.y <= 0 or mouse_pos.y >= window_size.y:
			Input.action_release("left_mb")
			on_lmb_released()
		if position.x != old.x or position.y != old.y and dragging == false:
			dragging = true


func _on_Area2D_input_event(_viewport, event, _shape_idx):
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
	global.location_card_selected = self
	move_to_front()
	$Sprite2D.scale = Vector2($Sprite2D.scale.x+0.017, $Sprite2D.scale.y+0.017)
	grab = get_viewport().get_mouse_position() - position
	old = position
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/up.mp3")
	$AudioStreamPlayer2D.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func on_lmb_released():
	global.location_card_selected = null
	$Sprite2D.scale = Vector2($Sprite2D.scale.x-0.017, $Sprite2D.scale.y-0.017)
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/down.mp3")
	$AudioStreamPlayer2D.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	reset_variables()


func reset_variables():
	put_down = true
	can_move = false
	dragging = false
	global.location_card_selected = null


func on_rmb_pressed():
	$Sprite2D.scale = Vector2($Sprite2D.scale.x+0.017, $Sprite2D.scale.y+0.017)
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/up.mp3")
	$AudioStreamPlayer2D.play()


func on_rmb_released():
	$Sprite2D.scale = Vector2($Sprite2D.scale.x-0.017, $Sprite2D.scale.y-0.017)
	global.location_card_selected = null
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stream = load("res://Sounds/Inventory/put.mp3")
	$AudioStreamPlayer2D.play()
	var me = inventory.generate_item(tag, $Sprite2D.texture.resource_path, -1, "location", null)
	inventory.add_item(me, -1)
	visible = false


func _on_Area2D_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_Area2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_audio_stream_player_2d_finished():
	if $AudioStreamPlayer2D.stream.resource_path == "res://Sounds/Inventory/put.mp3":
		queue_free()
