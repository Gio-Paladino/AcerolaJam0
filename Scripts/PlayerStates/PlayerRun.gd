extends "res://Scripts/PlayerStates/PlayerStateBase.gd"
class_name PlayerRun

func Enter():
	super()
	AnimatedSprite.play("PlayerRun")
	RunParticles.emitting = true
	
func Exit():
	RunParticles.emitting = false
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	super(_delta)
	
	
	if input_vector:
		Player.velocity.x = input_vector * move_toward( input_vector * Player.velocity.x, MOVE_SPEED, 20)
		
	Player.move_and_slide()
	
	if input_vector == 0 and Player.is_on_floor():
		Transitioned.emit(self, "PlayerIdle")
#	elif Player.is_on_floor() and Input.is_action_pressed("ui_down"):
#		Transitioned.emit(self, "PlayerCrouchWalk")
	elif Player.is_on_floor() and Input.is_action_pressed("ui_up"):  #InputBuffer.is_action_press_buffered("ui_up"):
		Player.NUM_JUMPS += 1
		Transitioned.emit(self, "PlayerJump")
#	elif !CoyoteTimer.is_stopped() and InputBuffer.is_action_press_buffered("ui_up"):
#		Player.NUM_JUMPS += 1
#		Player.velocity.y = JUMP_VELOCITY
#		Transitioned.emit(self, "PlayerJump")
#	elif Player.velocity.y > 0:
#		Transitioned.emit(self, "PlayerFall")
		
