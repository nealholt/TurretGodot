extends Node3D

# This script wobbles the meshinstance3d and moves
# forward and back to test if the turret can still
# track effectively from a moving base.

@export var x_rotate_rate := 0.1734
@export var z_rotate_rate := 0.3235
@export var z_move_rate := 2.436

func _physics_process(delta: float) -> void:
	rotate_x(x_rotate_rate * delta)
	rotate_z(z_rotate_rate * delta)
	global_position.z += z_move_rate * delta

func _on_timer_x_rotate_timeout() -> void:
	x_rotate_rate = -x_rotate_rate

func _on_timer_z_rotate_timeout() -> void:
	z_rotate_rate = -z_rotate_rate

func _on_timer_z_position_timeout() -> void:
	z_move_rate = -z_move_rate
