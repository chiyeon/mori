extends Control

func StartIntro():
	$Button.visible = false;
	$AnimationPlayer.play("Intro");
	
	yield($AnimationPlayer, "animation_finished");
	
	get_tree().change_scene("res://src/Opening.tscn");
