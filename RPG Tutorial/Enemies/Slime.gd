extends KinematicBody2D

export var ACCELERATION = 200
export var FRICTION = 200
export var MAX_SPEED = 40
export var KNOCKBACK = 140

var deathEffect = preload("res://Effects/SlimeDeathEffect.tscn")

onready var stats = $Stats
onready var hurtbox = $Hurtbox
onready var animatedSprite = $BlinkAnimation

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	hurtbox.create_hit_effect()
	hurtbox.start_invincibility(0.6)

func create_death_effect():
	var death_effect = deathEffect.instance()
	get_parent().add_child(death_effect)
	death_effect.global_position = global_position

func _on_Hurtbox_invincible_started():
	animatedSprite.play("Blink")


func _on_Hurtbox_invincible_ended():
	animatedSprite.play("Stop")

func _on_Stats_no_health():
	create_death_effect()
	queue_free()
