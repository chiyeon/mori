extends Control

onready var diemessage = preload("res://src/Desktop/DieMessage.tscn");
onready var messageself = preload("res://src/Desktop/MessageSelf.tscn");
onready var diewindow = preload("res://src/Desktop/DieWindow.tscn");

var timer = 0.0;
var m = 0.5;
var sus = false;

func GotoHome():
	$Home.visible = true;
	$MessagePurple.visible = false;
	$MessageGreen.visible = false;
	$MessageBlue.visible = false;
	$MessageRed.visible = false;

func GotoPurple():
	$Home.visible = false;
	$MessagePurple.visible = true;
	$MessageGreen.visible = false;
	$MessageBlue.visible = false;
	$MessageRed.visible = false;

func GotoGreen():
	$Home.visible = false;
	$MessagePurple.visible = false;
	$MessageGreen.visible = true;
	$MessageBlue.visible = false;
	$MessageRed.visible = false;

func GotoBlue():
	$Home.visible = false;
	$MessagePurple.visible = false;
	$MessageGreen.visible = false;
	$MessageBlue.visible = true;
	$MessageRed.visible = false;

func GotoRed():
	$Home.visible = false;
	$MessagePurple.visible = false;
	$MessageGreen.visible = false;
	$MessageBlue.visible = false;
	$MessageRed.visible = true;

func SendMessage():
	if($MessageRed/UserEdit.text == ""):
		return;
	
	var message = $MessageRed/UserEdit.text;
	var instance = messageself.instance();
	instance.get_node("MessageSelf/Label").text = message;
	$MessageRed/ScrollContainer/GridContainer.add_child(instance);
	$MessageRed/UserEdit.text = "";
	
	if(message.to_lower() == "die"):
		var c = 0;
		while(c < 100):
			if(c == 0):
				$Timer.wait_time = 1;
			if(c == 1):
				$Timer.wait_time = 0.25;
			if(c == 3):
				$Timer.wait_time = 2;
			if(c == 4):
				$Timer.wait_time = 0.03;
			if(c == 50):
				$Timer.wait_time = 0.01;
			
			var dieinstance = diewindow.instance();
			dieinstance.rect_position.x = rand_range(-40, 30);
			dieinstance.rect_position.y = rand_range(-40, 20);
			add_child(dieinstance);
			c += 1;
			$Timer.start();
			yield($Timer, "timeout");
			
		get_tree().change_scene("res://src/Shutdown.tscn");
		Global.SaveEnding("die");
	elif(message.to_lower() == "sus"):
		$MessageRed/Profile.texture = load("res://assets/textures/ui/window/sus.png");
		sus = true;
		$Sus.play();
		yield($Sus, "finished");
		get_tree().change_scene("res://src/Shutdown.tscn");

func _process(delta):
	if $MessageRed.visible:
		$MessageRed/ScrollContainer.scroll_vertical += 1;
		timer += delta;
		if(timer >= m):
			timer = 0;
			var instance = diemessage.instance();
			if(sus):
				instance.get_node("MessageOther4/Label").text = "SUS";
			$MessageRed/ScrollContainer/GridContainer.add_child(instance);


func _on_TextureButton_pressed():
	SendMessage();


func _on_UserEdit_text_entered(new_text):
	SendMessage();
