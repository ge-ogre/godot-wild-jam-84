extends Node2D

@export var attack: PackedScene # in this its a bullet

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("click"):
		shoot_bullet()

func shoot_bullet() -> void:
	var bullet = attack.instantiate()
	bullet.position = $HurtMarker.global_position
	bullet.rotation = self.global_rotation
	bullet.visible = true
	get_tree().root.add_child(bullet)
