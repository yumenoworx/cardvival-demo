extends Node2D

var slots_count = 5
var new_spawner = null


func _ready():
	var i = 0
	while i < slots_count:
		i += 1
		var spawner = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
		add_child(spawner)
		var sp_sprite = spawner.get_node("Sprite2D")
		var sp_width = sp_sprite.texture.get_width() * sp_sprite.get_scale().x
		spawner.position.x = (1366 - get_x_with_gap(slots_count + 1, sp_width)) / 2 + get_x_with_gap(i, sp_width)
		spawner.position.y = 768 / 2
	var location = load("res://Scenes/LocationObjectCards/LocationHolder.tscn").instantiate()
	add_child(location)
	location.position.x = 1366/2
	location.position.y = 768/2
	

func get_x_with_gap(count, width, gap=10): return (count * width + (count - 1) * gap) + 10
