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
	if(AnimatedSprite.frame == 2 or AnimatedSprite.frame == 8):
		Robot.velocity.x = 0
	else: 
		Robot.velocity.x =  input_vector * 100
	Robot.move_and_slide()
	
	if input_vector == 0 and Robot.is_on_floor():
		Transitioned.emit(self, "RobotIdle")
	

func Robot_Idle_Transition():
	Transitioned.emit(self, "RobotIdle")
