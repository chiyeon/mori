extends Node

onready var ErrorWindow = preload("res://src/ErrorWindow.tscn");

onready var Home = $Home;
onready var Youtube = $Youtube;
onready var Forum = $Forum;
onready var Games = $Games;
onready var Error = $Error;

func GotoHome():
	Home.visible = true;
	Youtube.visible = false;
	Forum.visible = false;
	Games.visible = false;
	Error.visible = false;
	
	Games.get_node("0").text = "BLOODBLO";
	Games.get_node("1").text = "BLOODBLOODB";
	Games.get_node("2").text = "bloodbloodb";
	Games.get_node("3").text = "oodbloodblo";

func GotoYoutube():
	Home.visible = false;
	Youtube.visible = true;
	Forum.visible = false;
	Games.visible = false;
	Error.visible = false;
	

func GotoForum():
	Home.visible = false;
	Youtube.visible = false;
	Forum.visible = true;
	Games.visible = false;
	Error.visible = false;
	

func GotoGames():
	Home.visible = false;
	Youtube.visible = false;
	Forum.visible = false;
	Games.visible = true;
	Error.visible = false;
	
	Games.get_node("Timer").start();
	yield(Games.get_node("Timer"), "timeout");
	
	Games.get_node("0").text = "GAMING";
	Games.get_node("1").text = "AMONG US";
	Games.get_node("2").text = "NEWS NOW";
	Games.get_node("3").text = "are you sus?";

func GotoError():
	Home.visible = false;
	Youtube.visible = false;
	Forum.visible = false;
	Games.visible = false;
	Error.visible = true;


func _on_UserEdit_text_changed(new_text):
	if(new_text.to_lower() == "rememberme"):
		Global.SaveEnding("rememberme");		
		var i = 0;
		while(i < 45):
			
			if(i == 0):
				$Timer.wait_time = 2;
			elif(i == 1):
				$Timer.wait_time = 0.5;
			elif(i == 3):
				$Timer.wait_time = 0.1;
			elif(i == 7):
				$Timer.wait_time = 0.03;
			
			var instance = ErrorWindow.instance();
			
			if(i == 0):
				instance.rect_position.x = -8;
				instance.rect_position.y = -8;
			else:
				instance.rect_position.x = rand_range(-40, 30);
				instance.rect_position.y = rand_range(-40, 20);
			
			add_child(instance);
			
			i += 1;
			$Timer.start();
			yield($Timer, "timeout");
		
		get_tree().change_scene("res://src/Shutdown.tscn");
	elif(new_text.to_lower() == "blood"):
		Global.SaveEnding("blood");
		$Eye/AnimationPlayer.play("Open");
		$scary.play();
		yield($Eye/AnimationPlayer, "animation_finished");
		get_tree().change_scene("res://src/Shutdown.tscn");
	elif(new_text.to_lower() == "404"):
		Global.SaveEnding("404");
		$error.play();
		yield($error, "finished");
		get_tree().change_scene("res://src/Shutdown.tscn");
