extends Area2D


var saved_body = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if saved_body != null and saved_body.dragging == false:
		saved_body.position.x = position.x
		saved_body.position.y = position.y

func _on_Tree_body_entered(body):
	saved_body = body


func _on_Tree_body_exited(body):
	saved_body = null
