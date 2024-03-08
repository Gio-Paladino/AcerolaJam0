extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotWalk

func Enter():
	super()
	AnimatedSprite.play("RobotWalk")
	WalkParticles.emitting = true
	InteractiongMgr.on_interact.connect(Robot_Idle_Transition)
	
func Exit():
	WalkParticles.emitting = false
	InteractiongMgr.on_interact.disconnect(Robot_Idle_Transition)
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	super(_delta)
	Robot.velocity.x = 50
	Robot.move_and_slide()
	

func Robot_Idle_Transition():
	Transitioned.emit(self, "RobotIdle")
