extends Control

@onready var start_button: Button = $VBoxContainer/start
@onready var quit_button:  Button = $VBoxContainer/quit

func _ready() -> void:
	# Fix layout: Make VBoxContainer fill + center
	var vbox = $VBoxContainer
	vbox.anchor_left = 0.5
	vbox.anchor_top = 0.5
	vbox.anchor_right = 0.5
	vbox.anchor_bottom = 0.5
	vbox.offset_left = -100
	vbox.offset_top = -75
	vbox.offset_right = 100
	vbox.offset_bottom = 75
	vbox.grow_horizontal = Control.GROW_DIRECTION_BOTH
	vbox.grow_vertical = Control.GROW_DIRECTION_BOTH
	start_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	quit_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	# Connect buttons
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://arena.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
