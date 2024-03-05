extends "res://Scripts/PlayerStates/PlayerStateBase.gd"
class_name PlayerFall

func Enter():
	super()
	AnimatedSprite.play("PlayerFall")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	
	super(_delta)
	# triple gravity fast fall, double normal fall
	if Input.is_action_pressed("ui_down"):
		Player.velocity.y += 4 * gravity * _delta
	else:
		Player.velocity.y += 2 * gravity * _delta
	
	Player.velocity.x = input_vector * move_toward( input_vector * Player.velocity.x, MOVE_SPEED, 20)
		

	if Player.is_on_floor():
		Player.NUM_JUMPS = 0
		Transitioned.emit(self, "PlayerIdle")
#	elif !CoyoteTimer.is_stopped() and InputBuffer.is_action_press_buffered("ui_up") and Player.NUM_JUMPS < MAX_JUMPS:
#		print("CoyoteTime Used from fall")
#		Player.NUM_JUMPS += 1
#		Player.velocity.y = JUMP_VELOCITY
#		Transitioned.emit(self, "PlayerJump")
#	elif InputBuffer.is_action_press_buffered("sword_stab"):
#		Transitioned.emit(self, "PlayerSwordStab")
#	elif player.is_on_wall_only():
#		Transitioned.emit(self, "PlayerWallSlide")
