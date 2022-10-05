extends Area2D

export(bool) var show = true

const HitEffect = preload("res://Effects/Effect.gd")

func _on_Hurtbox_area_entered(_area):
	if show:
		var effect = HitEffect.instance()
		var main = get_tree().current_scene
		main.add_child(effect)
		effect.global_position = global_position
