extends Node

var weapon_default = load("res://assets/resource/weapon1.tres")
var weapon_2 = load("res://assets/resource/weapon2.tres")
var current_weapon
func _ready() -> void:
	current_weapon = weapon_default
	print(current_weapon.damage)
func _process(delta: float) -> void:
	pass	
