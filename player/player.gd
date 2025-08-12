extends CharacterBody2D

@export var speed: int
@export var weapon_position_offset: int
@export var weapon: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var wep = weapon.instantiate()
	$PrimaryWeaponMarker.add_child(wep)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("a", "d", "w", "s")
	velocity = direction * speed

	move_and_slide()

	# Position Weapon Marker relative to the mouse
	$PrimaryWeaponMarker.global_position = position + Vector2(
		weapon_position_offset, 0).rotated((get_global_mouse_position() - position).angle())
