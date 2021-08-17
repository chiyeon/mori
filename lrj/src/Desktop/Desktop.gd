extends Control

onready var WindowParent = $Windows;
onready var TaskbarParent = $Taskbar/HBoxContainer;

onready var window = preload("res://src/Desktop/Window.tscn");
onready var windowWeb = preload("res://src/Desktop/WindowWeb.tscn");
onready var windowMessages = preload("res://src/Desktop/WindowMessages.tscn");
onready var windowTaskbar = preload("res://src/Desktop/WindowTaskbar.tscn");
onready var windowText = preload("res://src/Desktop/TextFile.tscn");
onready var windowFiles = preload("res://src/Desktop/WindowFiles.tscn");
onready var windowImage = preload("res://src/Desktop/ImageFile.tscn");

func _ready():
	Global.Reset();

func focus_window(window):
	WindowParent.move_child(window, WindowParent.get_child_count() - 1);
	for w in WindowParent.get_children():
		w.defocus_self();
	window.focus_self();

func open_web():
	var windowInstance = windowWeb.instance();
	windowInstance.init(self);
	WindowParent.add_child(windowInstance);
	
	var windowTaskbarInstance = windowTaskbar.instance();
	windowTaskbarInstance.init(windowInstance);
	TaskbarParent.add_child(windowTaskbarInstance);
	
	focus_window(windowInstance);

func open_messages():
	var windowInstance = windowMessages.instance();
	windowInstance.init(self);
	WindowParent.add_child(windowInstance);
	
	var windowTaskbarInstance = windowTaskbar.instance();
	windowTaskbarInstance.init(windowInstance);
	TaskbarParent.add_child(windowTaskbarInstance);
	
	focus_window(windowInstance);

func open_files():
	var windowInstance = windowFiles.instance();
	windowInstance.init(self);
	WindowParent.add_child(windowInstance);
	
	var windowTaskbarInstance = windowTaskbar.instance();
	windowTaskbarInstance.init(windowInstance);
	TaskbarParent.add_child(windowTaskbarInstance);
	
	focus_window(windowInstance);

func open_text(text):
	var windowInstance = windowText.instance();
	windowInstance.init(self);
	windowInstance.get_node("Control/Label").text = text;
	WindowParent.add_child(windowInstance);
	
	var windowTaskbarInstance = windowTaskbar.instance();
	windowTaskbarInstance.init(windowInstance);
	TaskbarParent.add_child(windowTaskbarInstance);
	
	focus_window(windowInstance);

func open_image(image, x, y):
	var windowInstance = windowImage.instance();
	windowInstance.init(self);
	windowInstance.get_node("Control2/TextureRect").texture = image;
	windowInstance.rect_size.x = x;
	windowInstance.rect_size.y = y;
	WindowParent.add_child(windowInstance);
	
	var windowTaskbarInstance = windowTaskbar.instance();
	windowTaskbarInstance.init(windowInstance);
	TaskbarParent.add_child(windowTaskbarInstance);
	
	focus_window(windowInstance);

