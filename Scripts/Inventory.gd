extends Node2D


var slots = 3
var location = null
var inventory = []
var old_inventory = []
var need_update = false


func _ready():
	inventory = [generate_item("Forest", "res://Sprites/forest.png", -1, "location"),
				 generate_item("Axe", "res://Sprites/axe.png", -1, "tool")]


func _process(delta):
	if inventory != old_inventory or need_update:
		var slots = get_tree().get_root().get_node("Main").get_node("Inventory").get_node("Slot")
		if slots != null:
			slots.free()
		need_update = false
		print("update")
		old_inventory.assign(inventory)
		print(old_inventory)
		print(inventory)
		print(old_inventory == inventory)
		var i = 0
		var window_size = get_viewport().size
		for item in inventory:
			i += 1
			var slot = load("res://Scenes/Cards/Slot.tscn").instantiate()
			slot.get_node("Sprite2D").set_texture(load(item["texture"]))
			slot.tag = item["tag"]
			slot.qty = item["qty"]
			slot.sprite = item["texture"]
			slot.type = item["type"]
			get_tree().get_root().get_node("Main").get_node("Inventory").add_child(slot)
			var sprite = slot.get_node("Sprite2D").texture.get_width() * slot.get_node("Sprite2D").get_scale().x
			slot.position.x = (window_size.x - get_x_with_gap(len(inventory) + 1, sprite)) / 2 + get_x_with_gap(i, sprite)
			slot.position.y = window_size.y - 64
			if i == 1:
				print(slot.position.x)
			elif i == len(inventory):
				print(slot.position.x)


func get_x_with_gap(count, width, gap=20): return (count * width + (count - 1) * gap)


func add_item(item, qty):
	for slot in inventory:
		if slot["tag"] == item["tag"]:
			slot["qty"] += qty
			update_slots()
			return
	inventory.append(item)
	print("added")

func update_slots():
	need_update = true


func take_item(item, qty):
	for slot in inventory:
		if slot["tag"] == item["tag"]:
			if qty != -1 and slot["qty"] != -1:
				slot["qty"] -= qty
				update_slots()
				return
			else:
				inventory.erase(slot)


func generate_item(tag, texture, qty=-1, type=null, stats=null):
	match type:
		"location": type = "res://Scenes/Cards/Location.tscn"
		"resource": type = "res://Scenes/Cards/Resource.tscn"
		"tool": type = "res://Scenes/Cards/Tool.tscn"
		_: "res://Scenes/Cards/Resource.tscn"
	return {"tag": tag, "texture": texture, "qty": qty, "type": type, "stats": stats}
