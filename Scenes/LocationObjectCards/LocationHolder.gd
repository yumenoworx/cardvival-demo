extends Area2D
var saved_body = null

func _ready():
	pass # Replace with function body.


func _process(delta):
	if saved_body != null and not saved_body.dragging:
		saved_body.position = position
	if Global.location != null:
		$LocationName.text = Global.location
	else:
		$LocationName.text = "??????"

func _on_Area2D_body_entered(body):
	if body.id == "forest":
		Global.location = "forest"
		saved_body = body


func _on_Area2D_body_exited(body):
	if body.id == "forest":
		Global.location = null
		saved_body = null
