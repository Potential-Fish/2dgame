extends CharacterBody2D
class_name Enemy
var health:int = 5
var damage:int
var knockback_timer:float
var knockback:Vector2
var direction

func _physics_process(delta: float) -> void:
	if knockback_timer > 0:
		velocity = -knockback
		knockback_timer -= delta 
	else:
		velocity = Vector2.ZERO
	
func apply_knockback(direction:Vector2,force:int,duration:float):
	
	knockback = direction * force

	knockback_timer = duration
	
