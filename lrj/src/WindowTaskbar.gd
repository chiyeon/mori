extends TextureButton

var window;

onready var normal_texture = preload("res://assets/textures/ui/taskbar/taskbar_instance.png");
onready var focused_texture = preload("res://assets/textures/ui/taskbar/taskbar_instance_focused.png")

func init(_window):
	window = _window;
	window.connect("on_window_close", self, "on_window_close");
	window.connect("on_focused", self, "on_focused");
	window.connect("on_defocused", self, "on_defocused");

func show_window():
	if(window):
		window.visible = true;
		window.desktop.focus_window(window);

func on_focused():
	texture_normal = focused_texture;

func on_defocused():
	texture_normal = normal_texture;

func on_window_close():
	queue_free();
