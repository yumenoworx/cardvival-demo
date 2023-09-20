extends Node2D
var command = ""
var stream = null

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
		if visible:
			_on_button_pressed()

func _on_text_edit_text_changed():
	$TextEdit.text = $TextEdit.text.replace("\n", "").replace("`", "")
	$TextEdit.set_caret_column(len($TextEdit.text))
	command = $TextEdit.text

func _on_button_pressed():
	if command == "" or command.replace(" ", "") == "" or command == null:
		$TextEdit.text = utils.random_choice(["Hello world!", 
											  "I divided the number by zero!",
											  "I sent my idea to the developers!"])
		send("Nothing happened...")
		return
	match command.split(" ")[0]:
		"quit":
			get_tree().quit()
		"echo":
			var text = command.split(" ", true, 1)[1]
			send(text)
		"help":
			send("Nobody help you.")
		"spawn_card":
			var instance = null
			if command.split(" ").size() >= 2:
				match command.split(" ")[1]:
					"tool": instance = "res://Scenes/Cards/Tool.tscn"
					"location": instance = "res://Scenes/Cards/Location.tscn"
					"resource": instance = "res://Scenes/Cards/Resource.tscn"
					_: send("spawn_card [tool|location|resource]"); return
				var item = load(instance).instantiate()
				item.position = get_viewport().get_mouse_position()
				get_tree().get_root().get_node("Main").get_node("Cards").add_child(item)
				send("Spawned: " + command.split(" ")[1] + " ({i})".format({"i": item.scene_file_path}))
			else:
				send("spawn_card [tool|location|resource]")
		"remove_card":
			var tags = []
			for node in get_tree().get_root().get_node("Main").get_node("Cards").get_children(false):
				var pos = node.position - get_viewport().get_mouse_position()
				print(pos)
				if pos.x >= -59 and pos.x <= 59 and pos.y >= -82 and pos.y <= 82:
					tags.append(node.tag + " ({i})".format({"i": node.scene_file_path}))
					node.queue_free()
			send("Deleted: " + ", ".join(tags))
		"clear":
			$Output.text = ""
			$TextEdit.clear()
			_on_text_edit_text_changed()
		"lab":
			get_tree().change_scene_to_file("res://Scenes/Laboratory.tscn")
		_:
			send(command + " command doesn't exist.")


func send(info: String):
	if $Output.text.find("\n") >= 26:
		$Output.text = ""
	$Output.text = $Output.text + "\n" + $TextEdit.text + "\n>> " + info
	$TextEdit.clear()
	_on_text_edit_text_changed()
