extends CharacterBody2D
class_name Player


@onready var aud_jump = $audJump
@onready var sound_animator = $SoundAnimator

const SPEED = 130.0
const JUMP_VELOCITY = -320.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

var points = 0


func _ready():
	GameManager.player = self
	GameManager.respawn_position = self.global_position


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		aud_jump.play()

	# Get the input direction and handle the movement/deceleration. (-1..0..1)
	var direction = Input.get_axis("move_left", "move_right")
	
	# Play animations
	if is_on_floor():
		if velocity.x == 0:
			sound_animator.pause()
			animated_sprite.play("idle")
		else:
			sound_animator.play("walk")
			animated_sprite.play("run")
	else:
		sound_animator.pause()
		animated_sprite.play("jump")
	
	# Look in the direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Move in the direction
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func add_point(to_add = 1):
	points += to_add
	$Camera2D/lblScore.text = "Pts. " + str(points)


func die():
	# Remove control
	# Slow game
	# After a while
	# Go to last re-spawn, or (0,0)
	pass
