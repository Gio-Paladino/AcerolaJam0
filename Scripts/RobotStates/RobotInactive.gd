extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotInactive

func Enter():
	super()
	AnimatedSprite.play("RobotIdle")
	InteractiongMgr.collision_mask = 0
	
func Exit():
	InteractiongMgr.collision_mask = 1024
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	Robot.velocity.y += gravity * _delta
	Robot.velocity.x = move_toward(Robot.velocity.x, 0, 60)
	Robot.move_and_slide()
	
	if Input.is_action_just_pressed("switch"):
		Transitioned.emit(self, "RobotIdle")
