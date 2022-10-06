extends Node2D

export(int) var wander_range

onready var pos_start = global_position
onready var target_position = global_position

onready var timer = $Timer

func _ready():
	update_position()

func get_time_left():
	return timer.time_left
	
func start_wander_timer(duration):
	timer.start(duration)

func update_position():
	var target_vector = Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))
	target_position = pos_start + target_vector

func _on_Timer_timeout():
	update_position()
