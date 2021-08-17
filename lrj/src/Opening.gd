extends Control

func _ready():
	RefreshEndingsCount();
	
func RefreshEndingsCount():
	var endings_count = 0;
	var data = Global.LoadEnding();
	for b in data.values():
		if b:
			endings_count += 1;
	
	$Endings.text = str(endings_count) + "/" + str(Global.num_endings) + "\nENDINGS";

func _on_Timer_timeout():
	$AudioStreamPlayer.play();

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://src/Logon.tscn");

func _process(delta):
	if Input.is_action_just_pressed("delete_save"):
		Global.DeleteSave();
		RefreshEndingsCount();
