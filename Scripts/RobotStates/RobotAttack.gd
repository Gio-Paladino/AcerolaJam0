extends "res://Scripts/RobotStates/RobotStateBase.gd"
class_name RobotAttack

@export var AttackTimer : Timer

func Enter():
	super()
	AnimatedSprite.play("RobotAttack")
	AttackTimer.timeout.connect(timeout)
	AttackTimer.one_shot = true
	AttackTimer.start()
	
func Exit():
	AttackTimer.timeout.disconnect(timeout)
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if AnimatedSprite.frame == 3:
		Robot.velocity.x = Robot.robot_direction * -1000
		InteractiongMgr.interact()
		AttackEffect.emitting = true
	else:
		Robot.velocity.x = 0
	Robot.move_and_slide()
	
	if Input.is_action_just_pressed("switch"):
		Transitioned.emit(self, "RobotInactive")
	
	
func timeout():
	Transitioned.emit(self, "RobotIdle")
