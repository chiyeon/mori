extends Node

var bugs_squashed = 0;
var pitch = 1;
var num_endings = 6;

func Reset():
	bugs_squashed = 0;
	pitch = 1;

func SquashBug():
	bugs_squashed += 1;
	if(bugs_squashed >= 25):
		get_tree().change_scene("res://src/Bugs.tscn");
		SaveEnding("bugs");
	print(bugs_squashed);

func DefaultSave():
	return {
		"404": false,
		"blood": false,
		"rememberme": false,
		"die": false,
		"face": false,
		"bugs": false
	}

func DeleteSave():
	var save_file = File.new();
	var save_data = DefaultSave();
	save_file.open("user://save.data", File.WRITE);
	save_file.store_var(save_data, true);
	save_file.close();
	

func SaveEnding(ending):
	var save_file = File.new();
	var save_data = DefaultSave();
	
	if save_file.file_exists("user://save.data"):
		save_file.open("user://save.data", File.READ);
		save_data = save_file.get_var(true);
		save_file.close();
	
	save_data[ending] = true;
	
	save_file.open("user://save.data", File.WRITE);
	save_file.store_var(save_data, true);
	save_file.close();

func LoadEnding():
	var save_file = File.new();
	var save_data = DefaultSave();
	
	if save_file.file_exists("user://save.data"):
		save_file.open("user://save.data", File.READ);
		save_data = save_file.get_var(true);
		save_file.close();
	
	return save_data;
