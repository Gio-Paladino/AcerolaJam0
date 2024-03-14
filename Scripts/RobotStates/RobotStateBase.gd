extends "res://Scripts/States.gd"
class_name RobotStateBase

const MOVE_SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var Robot : CharacterBody2D
@export var Collision : CollisionShape2D
@export var AnimatedSprite : AnimatedSprite2D
@export var InteractiongMgr : Interactable
@export var WalkParticles : GPUParticles2D
@export var AttackEffect : GPUParticles2D

var input_vector

func Enter():
	Robot.set_scale(Vector2(3,3))
	WalkParticles.emitting = false
	AttackEffect.emitting = false
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	
	input_vector = Input.get_axis("ui_left", "ui_right")
	if input_vector:
		AnimatedSprite.set_flip_h(input_vector == -1)
		Robot.robot_direction = input_vector

	Robot.velocity.y += gravity * _delta
	
	Robot.move_and_slide()
	
	if Input.is_action_just_pressed("switch"):
		print("Hello dumbass")
		Transitioned.emit(self, "RobotInactive")
