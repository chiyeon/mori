extends NinePatchRect

signal on_window_close();
signal on_focused();
signal on_defocused();

var desktop;
var is_dragging = false;
var is_mouse_over = false;
var is_maximized = false;

var offset;
var original_size;
var original_position;

onready var normal_texture = preload("res://assets/textures/ui/window/window_big.png");
onready var focused_texture = preload("res://assets/textures/ui/window/window_big_focused.png");

func init(_desktop):
	desktop = _desktop;

func _ready():
	original_size = rect_size;

func _process(delta):
	if Input.is_action_just_pressed("click") && is_mouse_over:
		desktop.focus_window(self);
	
	if is_dragging:
		if Input.is_action_just_released("click"):
			is_dragging = false;
		
		var mouse_pos = get_viewport().get_mouse_position();
		rect_position = mouse_pos + offset;

func focus_self():
	texture = focused_texture;
	emit_signal("on_focused");

func defocus_self():
	texture = normal_texture;
	emit_signal("on_defocused");

func start_dragging():
	is_dragging = true;
	var mouse_pos = get_viewport().get_mouse_position();
	offset = rect_position - mouse_pos;

func close_window():
	emit_signal("on_window_close");
	queue_free();

func maximize_window():
	if is_maximized:
		is_maximized = false;
		rect_position = original_position;
		rect_size = original_size;
	else:
		is_maximized = true;
		original_position = rect_position;
		rect_position = Vector2.ZERO;
		rect_size = Vector2(64, 58);

func minimize_window():
	defocus_self();
	visible = false;

func _on_Window_mouse_entered():
	is_mouse_over = true;

func _on_Window_mouse_exited():
	is_mouse_over = false;
