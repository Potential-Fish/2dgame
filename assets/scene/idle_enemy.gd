extends State
@export var enemy:CharacterBody2D
@onready var ray_cast_left: RayCast2D = $"../../marker left/RayCast left"
@onready var ray_cast_left_wall: RayCast2D = $"../../marker left/RayCast left wall"
@onready var ray_cast_right: RayCast2D = $"../../marker right/RayCast right"
@onready var ray_cast_right_wall: RayCast2D = $"../../marker right/RayCast right wall"
@onready var vision: Area2D = $"../../Area2D2"


var rng = RandomNumberGenerator.new()
var random_num
var starting_pos
var target_pos
var t:int = 0

func enter():
	print("idle")
	enemy.direction = 1
	starting_pos = enemy.global_position
func physics_update(delta):
	
	
	
	enemy.velocity.x = enemy.direction * enemy.speed 
	if ray_cast_left.is_colliding() == false:
		enemy.direction = 1
	if ray_cast_right.is_colliding() == false:
		enemy.direction = -1
	if ray_cast_left_wall.is_colliding() == true:
		enemy.direction = 1
	if ray_cast_right_wall.is_colliding() == true:
		enemy.direction = -1
	if enemy.direction == 1:
		vision.rotation = 0
	else:
				vision.rotation_degrees = 180
	


func _on_timer_timeout() -> void:
	
	if state_machine.current_state == $".":
		random_num = rng.randf_range(0,10)
		if random_num > 5:
			enemy.velocity.x = 0
			enemy.direction = enemy.direction * (-1)

			print(enemy.direction)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		state_machine.change_state("follow")
