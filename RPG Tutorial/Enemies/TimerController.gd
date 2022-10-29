extends Node2D

onready var timerController = $Timer

func start_timer(duration):
	timerController.start(duration)
