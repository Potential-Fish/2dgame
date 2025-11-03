extends Node

func hit_stop(enemy:CharacterBody2D):
	Engine.time_scale = 0
	enemy.modulate = Color(1,0,0)
	await get_tree().create_timer(0.05, true, false, true).timeout
	if enemy != null:	
		enemy.modulate = Color(1,1,1,1)
	Engine.time_scale = 1
