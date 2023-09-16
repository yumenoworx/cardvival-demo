extends Area2D

var current_location = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
	tree.position = global_position
	get_parent().add_child(tree)
	print(global_position)
	$Sprite2D.visible = true


func _process(delta):
	if global.location != null:
		visible = true
		$Sprite2D.visible = true
	else:
		visible = true
		$Sprite2D.visible = false
