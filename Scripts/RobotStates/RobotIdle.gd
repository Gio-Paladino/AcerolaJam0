extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotIdle


func Enter():
	super()
	AnimatedSprite.play("RobotIdle")
	InteractiongMgr.on_interact.connect(Robot_Walk_Transition)
	
func Exit():
	InteractiongMgr.on_interact.disconnect(Robot_Walk_Transition)
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	super(_delta)
	Robot.velocity.x = 0
	Robot.move_and_slide()

func Robot_Walk_Transition():
	Transitioned.emit(self, "RobotWalk")
