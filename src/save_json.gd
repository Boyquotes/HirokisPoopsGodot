class_name SaveJson
extends Reference

const save_path := "user://save.json"


var _file := File.new()

func write() -> void:
	var error := _file.open(save_path, File.WRITE)
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [save_path, error])
		return
