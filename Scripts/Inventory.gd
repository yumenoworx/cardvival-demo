extends Node2D


var slots = 3
var location = null
var inventory = [{"tag": "axe", "texture": "res://Sprites/axe.png",
				  "type": "res://Scenes/Cards/Tool.tscn", "stats": {"str": 5}},
				 {"tag": "forest", "texture": "res://Sprites/forest.png",
				  "type": "res://Scenes/Cards/Location.tscn", "stats": null}]


func _ready():
	pass


func _process(delta):
	pass


func add_item(item, qty):
	var slot_id = 0
	for slot in inventory:
		if slot["tag"] == item["tag"]:
			slot["qty"] += qty
			return
	inventory.append(item)

func generate_item(tag, texture, type=null, stats=null):
	match type:
		"location": type = "res://Scenes/Cards/Location.tscn"
		"resource": type = "res://Scenes/Cards/Resource.tscn"
		"tool": type = "res://Scenes/Cards/Tool.tscn"
		_: "res://Scenes/Cards/Resource.tscn"
	return {"tag": tag, "texture": texture, "type": type, "stats": stats}
