extends Area2D

var current_location = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
	add_child(tree)
	tree.position = position


func _process(delta):
	if global.location != null:
		visible = true
	else:
		visible = false
