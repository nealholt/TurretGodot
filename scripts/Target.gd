extends Node3D

@export var speed := 2.0
var time_tracker := 0.0
var time_limit := 5.0 #seconds
var state := 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state == 1:
		global_position.x += delta * speed
	elif state == 2:
		global_position.x -= delta * speed
	elif state == 3:
		global_position.z -= delta * speed*1.2
	elif state == 4:
		global_position.y += delta * speed
	elif state == 5:
		global_position.y -= delta * speed*2.2
	else:
		# Reset position and go back to state 1
		global_position = Vector3(0.0,8.0,16.0)
		state = 1
	
	time_tracker += delta
	if time_tracker > time_limit:
		state += 1
		time_tracker = 0.0
