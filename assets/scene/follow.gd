extends State
@export var enemy:CharacterBody2D


func physics_update(delta):
	enemy.velocity.x = enemy.direction * enemy.speed 

func _on_area_2d_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if state_machine.current_state == $".":
		
			print("exit")
			state_machine.change_state("idle")
