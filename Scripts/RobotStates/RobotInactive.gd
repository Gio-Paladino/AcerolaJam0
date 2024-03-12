extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotInactive

func Enter():
	super()
	AnimatedSprite.play("RobotIdle")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	Robot.velocity.y += gravity * _delta
	Robot.velocity.x = move_toward(Robot.velocity.x, 0, 60)
	Robot.move_and_slide()
	
	if Input.is_action_just_pressed("switch"):
		Transitioned.emit(self, "RobotIdle")
