extends Area2D


var saved_body = null
var first_attack = false
var hp = 15
var recovery_time = 5 
var resource_dropped = false
var resource = null
var tag = "Tree"
var timer = 5


func _process(delta):
	if global.location == "Forest":
		visible = true
		draw_hp()
		if resource == null or resource.dragging or not resource.visible:
			$Sprite2D.visible = true
		else:
			$Sprite2D.visible = false
		if died():
			$Sprite2D.modulate.a = 0.5
			drop_resource()
			if resource == null or not resource.visible:
				timer -= delta
				if timer <= 0:
					reset_state()
	else:
		visible = false


func died(): return hp <= 0


func hit(str): hp -= str

func draw_hp():
	if hp > 0: $HP.text = str(hp)
	else: $HP.text = ""

func drop_resource():
	if not resource_dropped and died():
		resource = load("res://Scenes/Cards/Resource.tscn").instantiate()
		get_tree().get_root().get_node("Main").get_node("Cards").add_child(resource)
		resource.position = global_position
		resource.tag = "Log"
		resource_dropped = true
		return resource


func reset_state():
	timer = 5
	hp = 15
	resource_dropped = false
	$Sprite2D.modulate.a = 1


func _on_audio_stream_player_2d_finished():
	pass # Replace with function body. 
