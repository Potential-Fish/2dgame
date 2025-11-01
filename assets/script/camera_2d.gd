extends Camera2D


@export var randomStrenght: float = 15.0
@export var shakeFade: float = 10.0
@export var player:CharacterBody2D
var rng = RandomNumberGenerator.new()

var shake_strenght: = 0.0

func apply_shake():
	shake_strenght = randomStrenght
func _physics_process(delta: float) -> void:
	global_position = lerp(global_position,player.global_position,0.1)
func _process(delta):
	if shake_strenght > 0:
		shake_strenght = lerpf(shake_strenght,0,shakeFade * delta)
		offset = randomOffset()
	
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strenght,shake_strenght),rng.randf_range(-shake_strenght,shake_strenght))


func _on_character_body_2d_touched_ground() -> void:
	apply_shake()
	print("shake")
