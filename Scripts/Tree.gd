extends Area2D


var saved_body = null
var first_attack = false
var hp = 15
var max_hp = 15
var recovery_time = 5 
var resource_dropped = false
var resource = null
var tool = null
var tag = "Tree"
var timer = 5
var immortal = false


func _process(delta):
	if global.location == "Forest":
		visible = true
		draw_hp()
		if resource != null:
			if not resource.visible or resource.dragging:
				$Sprite2D.visible = true
			else:
				$Sprite2D.visible = false
		elif tool != null:
			if not tool.visible or tool.dragging:
				$Sprite2D.visible = true
			elif not tool.dragging and tool.position == global_position:
				$Sprite2D.visible = false
		else:
			$Sprite2D.visible = true
		if died():
			$Sprite2D.modulate.a = 0.5
			drop_resource()
			if resource == null or not resource.visible:
				timer -= delta
				if timer <= 0:
					reset_state()
	else:
		visible = false


func died(): 
	if hp <= 0 and immortal:
		hp = 15
	return hp <= 0


func hit(strength): hp -= strength


func draw_hp():
	$ProgressBar.max_value = max_hp
	$ProgressBar.value = hp
	$ProgressBar.get_node("HP").text = str(hp)


func drop_resource():
	if not resource_dropped and died():
		resource = load("res://Scenes/Cards/Resource.tscn").instantiate()
		resource.position = global_position
		resource.tag = "Log"
		resource_dropped = true
		get_tree().get_root().get_node("Main").get_node("Cards").add_child(resource)
		return resource


func reset_state():
	timer = 5
	hp = max_hp
	$Sprite2D.modulate.a = 1
	$Sprite2D.visible = true
	visible = true
	resource_dropped = false
	resource = null


func _on_audio_stream_player_2d_finished():
	pass # Replace with function body. 
