extends Node2D


func _ready():
	print(get_tree().get_root().get_node("Main").get_node("Cards"))
