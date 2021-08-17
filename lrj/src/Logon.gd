extends Control

onready var NotificationTimer = $NotificationTimer;

onready var SuccessWindow = $SuccessWindow;
onready var FailWindow = $FailWindow;

onready var LogonWindow = $LogonWindow;
onready var UserEdit = $LogonWindow/UserEdit;
onready var PassEdit = $LogonWindow/PassEdit;

func attempt_login():
	var username = UserEdit.text;
	var password = PassEdit.text;
	
	UserEdit.text = "";
	PassEdit.text = "";
	
	if(username == "umbra" && password == "pr1me_3"):
		login("Desktop/Desktop");
	elif(username == "admin" && password == "adadmin"):
		login("Desktop/admin");
	else:
		fail();

func login(target):
	LogonWindow.visible = false;
	SuccessWindow.visible = true;
	
	NotificationTimer.start();
	yield(NotificationTimer, "timeout");
	
	get_tree().change_scene("res://src/" + target + ".tscn");
	
func fail():
	$Error.play();
	LogonWindow.visible = false;
	FailWindow.visible = true;
	
	NotificationTimer.start();
	yield(NotificationTimer, "timeout");
	
	FailWindow.visible = false;
	LogonWindow.visible = true;
