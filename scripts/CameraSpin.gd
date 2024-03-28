extends Position3D

onready var camera := $Camera
var mouse_capture = true
var rot_x = 0
var rot_y = 0
const LOOKAROUND_SPEED = 0.2 / 360 * 2 * PI

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if not mouse_capture: return
	if event is InputEventMouseMotion:
		rot_x -= event.relative.x * LOOKAROUND_SPEED
		rot_y += event.relative.y * LOOKAROUND_SPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.basis = Basis()
	rotate_object_local(Vector3(0, 1, 0), rot_x)
	rotate_object_local(Vector3(1, 0, 0), rot_y)
	if Input.is_action_just_pressed("pause"):
		mouse_capture = !mouse_capture
		if mouse_capture:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
