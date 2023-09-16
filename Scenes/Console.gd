extends Area2D
var command = null

func _ready():
	visible = false

func _process(delta):
	if Input.is_action_just_pressed("console") and not visible:
		visible = true
		$TextEdit.clear()
	elif Input.is_action_just_pressed("console"):
		visible = false
		$TextEdit.clear()
	if Input.is_action_pressed("enter"):
		_on_button_pressed()

func _on_text_edit_text_changed():
	command = $TextEdit.text.replace("\n", "")

func _on_button_pressed():
	if command.split(" ")[0] == "quit":
		get_tree().quit()
	elif command.split(" ")[0] == "echo":
		var text = command.split(" ", true, 1)[1]
		$Output.text = text
	elif command.split(" ")[0] == "help":
		$Output.text = "Nobody help you."
	else:
		$Output.text = "Unknown command."
	$TextEdit.clear()
