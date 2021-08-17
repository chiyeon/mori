extends Control

onready var Pause = $pause;
onready var Video = $Video;

var isMouseOver = false;

func _on_Video_mouse_entered():
	isMouseOver = true;

func _on_Video_mouse_exited():
	isMouseOver = false;

func _process(delta):
	Video.region_rect.position.x += delta * 10;
	if(Video.region_rect.position.x >= 60):
		Video.region_rect.position.x = -25;
	
	if isMouseOver:
		Pause.visible = true;
	else:
		Pause.visible = false;
