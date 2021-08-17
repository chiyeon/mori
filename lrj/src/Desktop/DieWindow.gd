extends NinePatchRect

func _ready():
	$AudioStreamPlayer.pitch_scale = Global.pitch;
	Global.pitch += 0.03;
	$AudioStreamPlayer.play();
