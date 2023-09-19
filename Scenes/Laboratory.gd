extends Node2D

func _ready():
	var tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
	global.location = "Forest"
	tree.immortal = true
	tree.position = Vector2(1366/2, 768/2)
	$Location.add_child(tree)
