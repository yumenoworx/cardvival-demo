extends Node2D

var slots_count = 5
var new_spawner = null

func _ready():
	var i = 0
	var window_size = get_viewport().size
	while i < slots_count:
		i += 1
		var spawner = load("res://Scenes/LocationObjectSpawner.tscn").instantiate()
		add_child(spawner)
		var sp_sprite = spawner.get_node("Sprite2D")
		var sp_width = sp_sprite.texture.get_width() * sp_sprite.get_scale().x
		spawner.position.x = (window_size.x - get_x_with_gap(slots_count + 1, sp_width)) / 2 + get_x_with_gap(i, sp_width)
		spawner.position.y = window_size.y / 2
		if i == 1:
			print(spawner.position.x)
		elif i == slots_count:
			print(spawner.position.x)
	var location = load("res://Scenes/LocationObjectCards/LocationHolder.tscn").instantiate()
	add_child(location)
	location.position.x = window_size.x/2
	location.position.y = window_size.y/2 #- 176
	


func get_x_with_gap(count, width, gap=10): return (count * width + (count - 1) * gap) + 10
