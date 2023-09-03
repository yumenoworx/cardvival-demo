extends Area2D
var saved_body = null

func _ready():
	pass # Replace with function body.


func _process(delta):
	if saved_body != null and not saved_body.dragging:
		global.location = "forest"
		saved_body.position = position
	if global.location != null:
		$LocationName.text = global.location
	else:
		$LocationName.text = "??????"

func _on_Area2D_body_entered(body):
	if body.id == "forest":
		saved_body = body


func _on_Area2D_body_exited(body):
	if body.id == "forest":
		global.location = null
		saved_body = null
