extends "res://Scripts/States.gd"
class_name PlayerStateBase

const MOVE_SPEED = 200.0
const JUMP_VELOCITY = -400.0
const MAX_JUMPS = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var input_vector

@export var Player : CharacterBody2D
@export var Collision : CollisionShape2D
@export var AnimatedSprite : AnimatedSprite2D
@export var RunParticles : GPUParticles2D
#@export var CoyoteTimer : Timer


func Enter():
	Player.set_scale(Vector2(2,2))
	RunParticles.emitting = false
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	input_vector = Input.get_axis("ui_left", "ui_right")
	if input_vector:
		AnimatedSprite.set_flip_h(input_vector == -1)
		Player.player_direction = input_vector
	#else:
		#Player.velocity.x = move_toward(Player.velocity.x, 0, 0.0001)
	Player.velocity.y += gravity * _delta
	
#	var was_on_floor = Player.is_on_floor()
	
	Player.move_and_slide()
	
#	if was_on_floor and !Player.is_on_floor():
#		#print("Start Timer")
#		CoyoteTimer.start()

