extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invincible

onready var timer = $Timer

signal invincible_started
signal invincible_ended

func set_invincible(value):
	invincible = value
	if invincible:
		emit_signal("invincible_started")
	else:
		emit_signal("invincible_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	self.invincible = false
	
func manual_invincibility_on():
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	print("Monitor off")

func manual_invincibility_off():
	monitoring = true
	monitorable = true
	print("Monitor on")

func _on_Hurtbox_invincible_started():
	set_deferred("monitoring", false)

func _on_Hurtbox_invincible_ended():
	monitoring = true
