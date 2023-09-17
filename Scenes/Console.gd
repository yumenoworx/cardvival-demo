extends Area2D
var command = null

func _ready():
	visible = false
	$Output.text = ""

func _process(_delta):
	if Input.is_action_just_pressed("console") and not visible:
		visible = true
		$TextEdit.clear()
		$TextEdit.editable = true
	elif Input.is_action_just_pressed("console"):
		visible = false
		$TextEdit.clear()
		$TextEdit.editable = false
		_on_text_edit_text_changed()
	if Input.is_action_just_pressed("enter"):
		_on_button_pressed()

func _on_text_edit_text_changed():
	$TextEdit.text = $TextEdit.text.replace("\n", "").replace("`", "")
	$TextEdit.set_caret_column(len($TextEdit.text))
	command = $TextEdit.text

func _on_button_pressed():
	if command == "":
		send("Nothing happened...")
	match command.split(" ")[0]:
		"quit":
			get_tree().quit()
		"echo":
			var text = command.split(" ", true, 1)[1]
			send(text)
		"help":
			send("Nobody help you.")
		"spawn_instance":
			var instance = null
			match command.split(" ")[1]:
				"tool": instance = "res://Scenes/Cards/Tool.tscn"
				"location": instance = "res://Scenes/Cards/Location.tscn"
				"resource": instance = "res://Scenes/Cards/Resource.tscn"
				_: $Output.text = "spawn_instance [tool|location|resource]"; return
			var item = load(instance).instantiate()
			get_tree().get_root().get_node("Main").get_node("Cards").add_child(item)
			item.position = get_viewport().get_mouse_position()
			send("Spawned: " + command.split(" ")[1])
		"remove_instance":
			var tags = []
			for node in get_tree().get_root().get_node("Main").get_node("Cards").get_children(false):
				var pos = node.position - get_viewport().get_mouse_position()
				print(pos)
				if pos.x >= -59 and pos.x <= 59 and pos.y >= -82 and pos.y <= 82:
					tags.append(node.tag)
					node.queue_free()
			send("Deleted: " + str(tags))
			print($Output.text)
		_:
			send(command + " command doesn't exist.")


func send(info: String):
	$Output.text = $Output.text + "\n" + $TextEdit.text + "\n>> " + info
	$TextEdit.clear()
	_on_text_edit_text_changed()
