extends State
@export var player:CharacterBody2D
@export var sprite:AnimatedSprite2D
func enter():
	player.velocity.x = 0
	

			
func update(delta):
	sprite.play("idle")
	if player.input_order.is_empty() == false:
		state_machine.change_state("move")
	if Input.is_action_pressed("ui_accept") && player.is_on_floor():
		print("hi")
		state_machine.change_state("jump")
	if Input.is_action_just_pressed("left click"):
		state_machine.change_state("attack")
		
