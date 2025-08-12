extends Node

@export var max_health: int

var current_health: int

func _ready() -> void:
	current_health = max_health

func take_damage(damage: int) -> void:
	_change_health(damage)

func _change_health(amount: int):
	current_health -= amount
	if current_health <= 0:
		get_parent().queue_free()
