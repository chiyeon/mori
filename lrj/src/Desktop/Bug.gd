extends TextureButton

func Squash():
	$Squash.play();
	visible = false;
	Global.SquashBug();
	
	yield($Squash, "finished");
	
	queue_free();
