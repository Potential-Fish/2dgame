extends CharacterBody2D
var direction = 1
@onready var ray_cast_left: RayCast2D = $"RayCast left"
@onready var ray_cast_right: RayCast2D = $"RayCast right"


func _physics_process(delta: float) -> void:

	
	velocity.y += get_gravity().y * delta
	velocity.x = 20000 * delta * direction
	move_and_slide()
	
	if ray_cast_left.is_colliding() == false:
		direction = 1
	if ray_cast_right.is_colliding() == false:
		direction = -1
		
		
	
	
	
