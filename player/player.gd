extends Area2D

@export var speed: int
@export var weapon_position_offset: int
@export var weapon: PackedScene

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var wep = weapon.instantiate()
	$PrimaryWeaponMarker.add_child(wep)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += velocity * speed * delta

	# Position Weapon Marker relative to the mouse
	$PrimaryWeaponMarker.global_position = position + Vector2(
		weapon_position_offset, 0).rotated((get_global_mouse_position() - position).angle())
