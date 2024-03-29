extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotIdle


func Enter():
	super()
	AnimatedSprite.play("RobotIdle")

	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	super(_delta)
	Robot.velocity.x = 0
	Robot.move_and_slide()
	
	if input_vector != 0 and Robot.is_on_floor():
		Transitioned.emit(self, "RobotWalk")
	if Input.is_action_just_pressed("interact"):
		Transitioned.emit(self, "RobotAttack")

