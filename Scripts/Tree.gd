extends Area2D


var saved_body = null
var attacked = false
var hp = 15
var recovery_time = 5 
var resource_dropped = false

func _process(delta):
	if Global.location == "forest":
		visible = true
		$TreeHP.text = str(hp)
		if saved_body != null and not saved_body.dragging and hp > 0:
			saved_body.position = global_position
			print(global_position)
			if not attacked and not saved_body.cooldown:
				hp -= 3
				attacked = true
				saved_body.put_down = false
				#saved_body.cooldown = true
			elif saved_body.put_down and not saved_body.cooldown:
				hp -= 3
				saved_body.put_down = false
				#saved_body.cooldown = true
		elif hp <= 0:
			if saved_body != null:
				saved_body.position.y += 22
			$Sprite2D.modulate.a = 0.5
			recovery_time -= delta
			if not resource_dropped:
				var resource = load("res://Scenes/Cards/Resource.tscn").instantiate()
				add_child(resource)
				resource.id = "log"
				resource_dropped = true
			if recovery_time <= 0:
				$Sprite2D.modulate.a = 1
				recovery_time = 5
				hp = 15
				resource_dropped = false
	else:
		visible = false


func _on_Tree_body_entered(body):
	if body.id == "axe" and visible == true:
		saved_body = body


func _on_Tree_body_exited(body):
	if body.id == "axe":
		saved_body = null
		attacked = false
