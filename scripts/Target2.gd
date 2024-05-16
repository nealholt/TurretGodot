extends Node3D
# Make this target rotate around the turret
# Then make the target oscillate up and down

@export var radius:float = 50
@export var orbit_speed :float = 0.1
@export var vertical_speed :float = 0.1
var elapsed_time := 0.0
@export var height_limit:float = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time += delta
	global_position.x = cos(elapsed_time * orbit_speed) * radius
	global_position.z = sin(elapsed_time * orbit_speed) * radius
	global_position.y = sin(elapsed_time * vertical_speed) * height_limit + 4
