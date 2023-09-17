extends Node

func random_choice(array):
	return array[randi() % array.size()]


func get_files(path):
	var files = []
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and not ".import" in file:
			files.append(path + file)
	return files
