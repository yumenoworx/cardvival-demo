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
		elif not file.ends_with(".import"):
			files.append(path + file)
			console.send(path + file)
	return files


func get_sound_from(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamWAV.new()
	sound.data = file.get_buffer(file.get_length())
	return sound
	
