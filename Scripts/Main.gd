extends Node2D


var slots = 3
var location = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0
	while i < slots:
		i += 1
