extends Area2D
@export var timer:Timer

func _ready() -> void:
	$Timer.start()
	hide()
func _physics_process(delta: float) -> void:
	await get_tree().create_timer(0.09).timeout
	


func _on_timer_timeout() -> void:
	print("hide")
	
