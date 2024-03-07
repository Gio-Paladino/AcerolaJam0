extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotWalk

func Enter():
	super()
	AnimatedSprite.play("RobotWalk")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	super(_delta)
	Robot.velocity.x = 50
	Robot.move_and_slide()
	
	if InteractiongMgr.on_interact && Input.is_action_just_pressed("interact"):
		Transitioned.emit(self, "RobotIdle")
