extends CharacterBody3D
# Source:
# https://www.udemy.com/course/complete-godot-3d/learn/lecture/40979546#questions
const SPEED = 5.0

var mouse_motion := Vector2.ZERO

@onready var camera_pivot: Node3D = $CameraPivot

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	handle_camera_rotation()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	var vertical := Input.get_axis("down","up")
	if vertical:
		velocity.y = vertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

# https://www.udemy.com/course/complete-godot-3d/learn/lecture/40979542#questions
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Think of 0.001 as sensitivity to mouse motion
		mouse_motion = -event.relative * 0.001

func handle_camera_rotation() -> void:
	rotate_y(mouse_motion.x)
	# https://www.udemy.com/course/complete-godot-3d/learn/lecture/40979546#questions
	camera_pivot.rotate_x(mouse_motion.y)
	#camera_pivot.rotation_degrees.x = clampf(camera_pivot.rotation_degrees.x, -90.0, 90.0)
	mouse_motion = Vector2.ZERO # Reset

