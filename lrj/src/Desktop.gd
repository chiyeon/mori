extends Control

onready var WindowParent = $Windows;
onready var TaskbarParent = $Taskbar/HBoxContainer;

onready var window = preload("res://src/Window.tscn");
onready var windowTaskbar = preload("res://src/WindowTaskbar.tscn");

func focus_window(window):
	WindowParent.move_child(window, WindowParent.get_child_count() - 1);
	for w in WindowParent.get_children():
		w.defocus_self();
	window.focus_self();

func open_web():
	var windowInstance = window.instance();
	windowInstance.init(self);
	WindowParent.add_child(windowInstance);
	
	var windowTaskbarInstance = windowTaskbar.instance();
	windowTaskbarInstance.init(windowInstance);
	TaskbarParent.add_child(windowTaskbarInstance);
	
	focus_window(windowInstance);
	
	print(WindowParent.get_children());
