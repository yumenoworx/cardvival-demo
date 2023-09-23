extends Node2D

var slots_count = 5
var new_spawner = null


func _ready():
	var resolution = global.resolution
	var i = 0
	while i < slots_count:
		i += 1
		var spawner = load("res://Scenes/LocationObjectCards/Tree.tscn").instantiate()
		var sp_sprite = spawner.get_node("Sprite2D")
		var sp_width = sp_sprite.texture.get_width() * sp_sprite.get_scale().x
		var x = (resolution.x - get_x_with_gap(slots_count + 1, sp_width)) / 2 + get_x_with_gap(i, sp_width)
		var y = resolution.y / 2
		spawner.position = Vector2(x, y)
		add_child(spawner)
	var location = load("res://Scenes/LocationObjectCards/LocationHolder.tscn").instantiate()
	location.position = resolution / 2
	add_child(location)
	

func get_x_with_gap(count, width, gap=10): return (count * width + (count - 1) * gap) + 10
