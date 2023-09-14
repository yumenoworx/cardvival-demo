extends Area2D
var saved_body = null

func _ready():
	pass # Replace with function body.


func _process(delta):
	if saved_body != null and not saved_body.dragging:
		if $LocationName.text == "??????":
			position.y -= 176
			saved_body.position = global_position
		global.location = saved_body.tag
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
	if global.location != null:
		$LocationName.text = global.location
	else:
		$LocationName.text = "??????"


func _on_Area2D_body_entered(body):
	if body.tag == "Forest":
		saved_body = body
		$AudioStreamPlayer.stream = load("res://Sounds/Locations/Forest.mp3")


func _on_Area2D_body_exited(body):
	if body.tag == "Forest" and body.position != global_position:
		global.location = null
		saved_body = null
		position.y += 176
		$AudioStreamPlayer.stop()
