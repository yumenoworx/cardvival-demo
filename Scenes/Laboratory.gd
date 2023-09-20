extends Node2D
var mode = "🎶"
var previous_mode = null
var tree = null
var timer = 0.5
var arrow_timer = 1

func _on_audio_stream_player_finished():
	#$AudioStreamPlayer.play()
	pass


func _process(delta):
	if Input.is_action_just_pressed("enter"):
		if mode =="🎶":
			$Watermark.get_node("Label2").text = "Damage two trees at once 🪓"
			$Watermark.get_node("Label3").text = "~ The chance of damaging two trees at the same time is 10%. ~"
			mode = "🪓"
		elif mode == "🪓":
			$Watermark.get_node("Label2").text = "Btw, look at the health bar! ❤️"
			$Watermark.get_node("Label3").text = "~ Looks cool, doesn't it? At least it's better than HP in numbers. ✨ ~"
			mode = "❤️"
		elif mode == "❤️":
			$Watermark.get_node("Label2").text = "I also updated the inventory 🪄🎒"
			$Watermark.get_node("Label3").text = "~ It got a new look ✨ and sounds 🎶. ~"
			mode = "🎒"
		elif mode == "🎒":
			$Watermark.get_node("Label2").text = "Locationholder displays a hint 💡"
			$Watermark.get_node("Label3").text = "~ It looks good and will help new players. 🐤 ~"
			mode = "🌳"
		elif mode == "🌳":
			$Watermark.visible = false
			$Logo.visible = true
			$Logo.position = Vector2((1366/2)-($Logo.get_global_rect().size.x/2), (768/2)-($Logo.get_global_rect().size.y/2))
			mode = "end"
	if mode != previous_mode:
		for child in $Location.get_children():
			child.queue_free()
		for child in $Cards.get_children():
			child.queue_free()
	match mode:
		"🎶":
			if previous_mode != "🎶":
				global.location = "Forest"
				var tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
				tree.immortal = true
				tree.position = Vector2(1366/2, 768/2)
				$Location.add_child(tree)
				
				var axe = load("res://Scenes/Cards/Tool.tscn").instantiate()
				axe.position = Vector2(1366/2, (768/2)+222)
				$Cards.add_child(axe)
		"🪓":
			if previous_mode != "🪓":
				var i = 0
				var window_size = get_viewport().size
				while i < 2:
					i += 1
					var tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
					$Location.add_child(tree)
					var sp_sprite = tree.get_node("Sprite2D")
					var sp_width = sp_sprite.texture.get_width() * sp_sprite.get_scale().x
					tree.position.x = (window_size.x - get_x_with_gap(2 + 1, sp_width)) / 2 + get_x_with_gap(i, sp_width)
					tree.position.y = window_size.y / 2
					tree.immortal = true
				var axe = load("res://Scenes/Cards/Tool.tscn").instantiate()
				axe.position = Vector2(1366/2, (768/2)+222)
				axe.chance = 0.5
				$Cards.add_child(axe)
		"❤️":
			if previous_mode != "❤️":
				global.location = "Forest"
				tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
				tree.position = Vector2(1366/2, 768/2)
				$Location.add_child(tree)
				$Circle.visible = true
			arrow_timer -= delta
			if arrow_timer <= 0 and $Circle.get_node("Arrow3").visible:
				$Circle.get_node("Arrow3").visible = false
				$Circle.get_node("Arrow4").visible = false
				arrow_timer = 1
			elif arrow_timer <= 0:
				$Circle.get_node("Arrow3").visible = true
				$Circle.get_node("Arrow4").visible = true
				arrow_timer = 1
			if not tree.died():
				timer -= delta
				if timer <= 0:
					tree.hit(3)
					timer = 0.5
			else:
				for card in $Cards.get_children():
					if card.tag == "Log":
						card.free()
		"🎒":
			$Circle.visible = false
			var item = inventory.generate_item("Axe", "res://Sprites/axe.png", -1, "tool", null)
			if previous_mode != "🎒":
				inventory.add_item(item, -1)
			item = inventory.generate_item("Log", "res://Sprites/log.png", 11, "resource", null)
			if previous_mode != "🎒":
				inventory.add_item(item, 11)
			$Inventory.visible = true
		"🌳":
			$Inventory.visible = false
			if previous_mode != mode:
				var lcholder = load("res://Scenes/LocationObjectCards/LocationHolder.tscn").instantiate()
				lcholder.position = Vector2(1366/2, 768/2)
				$Location.add_child(lcholder)
				var location = load("res://Scenes/Cards/Location.tscn").instantiate()
				location.position = Vector2(1366/2, (768/2)+222)
				$Cards.add_child(location)
				tree = lcholder
			tree.position = Vector2(1366/2, 768/2)
	previous_mode = mode

func get_x_with_gap(count, width, gap=10): return (count * width + (count - 1) * gap) + 10
