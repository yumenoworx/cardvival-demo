extends Area2D


var saved_body = null
var first_attack = false
var hp = 15
var recovery_time = 5 
var resource_dropped = false
var resource = null


func _process(delta):
	if global.location == "Forest":
		visible = true
		if hp > 0:
			$TreeHP.text = str(hp)
		else:
			$TreeHP.text = ""
		if saved_body != null and not saved_body.dragging and hp > 0:
			$Sprite2D.visible = false
			saved_body.position = global_position
			if not first_attack and not saved_body.cooldown:
				hit(3)
				first_attack = true
			elif saved_body.put_down and not saved_body.cooldown:
				hit(3)
		elif saved_body == null and resource == null:
			$Sprite2D.visible = true
		if hp <= 0:
			$Sprite2D.modulate.a = 0.5
			if not resource_dropped:
				hide_tool()
				drop_resource()
				resource_dropped = true
			if resource == null:
				recovery_time -= delta
				if recovery_time <= 0:
					$Sprite2D.modulate.a = 1
					recovery_time = 5
					hp = 15
					resource_dropped = false
			else:
				if resource.dragging:
					$Sprite2D.visible = true
				elif not resource.visible:
					$Sprite2D.visible = true
				else:
					$Sprite2D.visible = false
	else:
		visible = false


func _on_Tree_body_entered(body):
	if body.tag == "Axe" and visible == true:
		saved_body = body


func hit(str):
	saved_body.get_node("AudioStreamPlayer2D").stream = null
	$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/Tools/Axe/Hit.mp3")
	$AudioStreamPlayer2D.play()
	hp -= str
	saved_body.put_down = false


func drop_resource():
	resource = load("res://Scenes/Cards/Resource.tscn").instantiate()
	get_tree().get_root().get_node("Main").get_node("Cards").add_child(resource)
	resource.position = global_position
	resource.tag = "Log"


func hide_tool():
	var item = inventory.generate_item(saved_body.tag, 
									   saved_body.get_node("Sprite2D").texture.resource_path, 
									   -1, "tool", null)
	saved_body.free()
	inventory.add_item(item, -1)


func _on_Tree_body_exited(body):
	if body.tag == "Axe":
		saved_body = null
		first_attack = false
		$Sprite2D.visible = true


func _on_audio_stream_player_2d_finished():
	pass # Replace with function body. 
