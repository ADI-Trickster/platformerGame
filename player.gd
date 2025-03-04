extends CharacterBody2D

class_name Player

@onready var jumpAudio : AudioStreamPlayer = $Jump
@onready var hitAudio : AudioStreamPlayer = $Damaged

const SPEED = 500.0
const JUMP_VELOCITY = -550.0

var lives := 5;
var spawn_pos : Vector2

signal lives_updated(Currntlives: int)

func _ready() -> void:
	spawn_pos = self.position;
	#emit_signal("lives_updated", Currntlives)
	

func respawn():
		#repawn the player
		self.position = spawn_pos;

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumpAudio.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
