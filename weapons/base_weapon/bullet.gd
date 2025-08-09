extends Area2D

@export var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2(1, 0).rotated(global_rotation)
	position += direction * speed * delta


func _on_area_entered(area:Area2D) -> void:
	area.queue_free()
	queue_free()
