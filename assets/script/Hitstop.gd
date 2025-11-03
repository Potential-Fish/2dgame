extends Node

func hit_stop():
	Engine.time_scale = 0
	await get_tree().create_timer(0.05, true, false, true).timeout
	Engine.time_scale = 1
