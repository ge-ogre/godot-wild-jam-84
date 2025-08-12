extends CharacterBody2D

@export var speed: int
@export var target_path: NodePath

var player: Node2D
var direction: Vector2

func _ready() -> void:
	$AnimatedSprite2D.play()
	player = get_node(target_path)

func _process(delta: float) -> void:
	direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
