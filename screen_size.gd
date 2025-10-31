# AutoScaler.gd – NO BLACK BARS (4K + ANY Monitor)
extends Node

@export var start_fullscreen := true

func _ready():
	await get_tree().process_frame
	if start_fullscreen:
		go_fullscreen_fill()

func go_fullscreen_fill():
	var window = get_window()
	
	# Force fullscreen
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	
	# Get monitor size
	var monitor_idx = DisplayServer.window_get_current_screen()
	var monitor_size = DisplayServer.screen_get_size(monitor_idx)
	window.size = monitor_size
	
	print("Fullscreen Fill: 512×512 → ", monitor_size, " (no bars)")

# F11 Toggle
func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		var window = get_window()
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			window.size = Vector2i(1024, 1024)
		else:
			go_fullscreen_fill()
