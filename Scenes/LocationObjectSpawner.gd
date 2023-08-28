extends Area2D

var current_location = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instance()
	add_child(tree)
	tree.position = position
