extends Area2D


var saved_body = null
var attacked = false
var hp = 15
var recovery_time = 5 
var resource_dropped = false
var resource = null

func _process(delta):
	if resource != null:
		return
	if global.location == "Forest":
		visible = true
		if hp > 0:
			$TreeHP.text = str(hp)
		else:
			$TreeHP.text = ""
		if saved_body != null and saved_body.dragging:
			$Sprite2D.visible = true
		if saved_body != null and not saved_body.dragging and hp > 0:
			$Sprite2D.visible = false
			saved_body.position = global_position
			if not attacked and not saved_body.cooldown:
				saved_body.get_node("AudioStreamPlayer2D").stream = null
				$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/Tools/Axe/Hit.mp3")
				$AudioStreamPlayer2D.play()
				hp -= 3
				attacked = true
				saved_body.put_down = false
			elif saved_body.put_down and not saved_body.cooldown:
				saved_body.get_node("AudioStreamPlayer2D").stream = null
				$AudioStreamPlayer2D.stream = load("res://Sounds/Cards/Tools/Axe/Hit.mp3")
				$AudioStreamPlayer2D.play()
				hp -= 3
				saved_body.put_down = false
		elif hp <= 0:
			$Sprite2D.modulate.a = 0.5
			if not resource_dropped:
				saved_body.position.y += 210
				resource = load("res://Scenes/Cards/Resource.tscn").instantiate()
				add_child(resource)
				resource.tag = "Log"
				resource_dropped = true
				return
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
				else:
					$Sprite2D.visible = false
	else:
		visible = false


func _on_Tree_body_entered(body):
	if body.tag == "Axe" and visible == true:
		saved_body = body


func _on_Tree_body_exited(body):
	if body.tag == "Axe":
		saved_body = null
		attacked = false
		$Sprite2D.visible = true


func _on_audio_stream_player_2d_finished():
	pass # Replace with function body.
