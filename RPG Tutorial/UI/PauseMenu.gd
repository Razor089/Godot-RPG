extends Control

onready var label = $CenterContainer/VBoxContainer/Label
onready var resume = $CenterContainer/VBoxContainer/Resume
onready var quit = $CenterContainer/VBoxContainer/Quit

var is_paused = false setget set_is_paused

func _ready():
	var error = PlayerStats.connect("no_health", self, "on_game_over")
	if error != OK:
		print("Error!")
	resume.grab_focus()

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	resume.grab_focus()


func _on_Resume_button_up():
	self.is_paused = false;


func _on_TextureButton_button_up():
	get_tree().quit()


func on_game_over():
	label.text = "Game Over"
	resume.visible = false
	quit.grab_focus()
	self.is_paused = true
