extends TextureRect

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	var mouse_pos = get_viewport().get_mouse_position();
	self.rect_position = mouse_pos;

func _input(event):
	var mouse_pos = get_viewport().get_mouse_position();
	self.rect_position = mouse_pos;
