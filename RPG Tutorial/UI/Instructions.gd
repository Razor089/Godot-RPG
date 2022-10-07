extends Control

onready var buttonA = $ButtonA
onready var buttonB = $ButtonB


func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		buttonA.material.set_shader_param("active", true)
	elif Input.is_action_just_released("attack"):
		buttonA.material.set_shader_param("active", false)
	
	if Input.is_action_just_pressed("roll"):
		buttonB.material.set_shader_param("active", true)
	elif Input.is_action_just_released("roll"):
		buttonB.material.set_shader_param("active", false)
	
