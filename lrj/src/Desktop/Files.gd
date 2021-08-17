extends Control

func OpenHome():
	$Home.visible = true;
	$Folder1.visible = false;
	$Folder2.visible = false;
	$Folder3.visible = false;

func OpenFolder1():
	$Home.visible = false;
	$Folder1.visible = true;
	$Folder2.visible = false;
	$Folder3.visible = false;

func OpenFolder2():
	$Home.visible = false;
	$Folder1.visible = false;
	$Folder2.visible = true;
	$Folder3.visible = false;

func OpenFolder3():
	$Home.visible = false;
	$Folder1.visible = false;
	$Folder2.visible = false;
	$Folder3.visible = true;

func OpenShopping():
	get_node("/root/Control").open_text("SHOPPING\n-bread\n-milk\n-tea");

func OpenTodo():
	get_node("/root/Control").open_text("TODO\n-study\n-bake\n-read");

func OpenBeach():
	get_node("/root/Control").open_image(load("res://assets/textures/ui/beach.png"), 54, 48);
	

func OpenResearch():
	get_node("/root/Control").open_text("LOGON\nu:admin\np:adadmin");

func OpenShopping2():
	get_node("/root/Control").open_text("SHOPPING\n-hatchet\n-rope\n-tape");


func OpenDie():
	get_node("/root/Control").open_text("KILL KILL\nKILL KILL\nKILL KILL\nKILL KILL");

func OpenFace():
	get_node("/root/Control").open_image(load("res://assets/textures/ui/face.png"), 44, 38);

func OpenBlood():
	get_node("/root/Control").open_image(load("res://assets/textures/ui/blood.png"), 44, 38);

func OpenFace2():
	get_node("/root/Control").open_image(load("res://assets/textures/ui/face2full.png"), 54, 48);
	Global.SaveEnding("face");
	$Timer.start();
	yield($Timer, "timeout");
	get_tree().change_scene("res://src/Shutdown.tscn");
