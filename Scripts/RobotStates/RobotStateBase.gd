extends "res://Scripts/States.gd"
class_name RobotStateBase

const MOVE_SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var Robot : CharacterBody2D
@export var Collision : CollisionShape2D
@export var AnimatedSprite : AnimatedSprite2D

func Enter():
	Robot.set_scale(Vector2(4,4))
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	Robot.velocity.y += gravity * _delta
	
	Robot.move_and_slide()
