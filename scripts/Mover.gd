extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var turret: Node3D = $Turret

func _physics_process(_delta: float) -> void:
	# Escape key to quit
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	# Switch targets
	if Input.is_action_just_pressed("ui_accept"):
		print('Switching targets')
		if turret.target == $"../Target1":
			turret.target = $"../Target2"
		else:
			turret.target = $"../Target1"
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
