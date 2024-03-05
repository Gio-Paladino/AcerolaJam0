extends "res://Scripts/PlayerStates/PlayerStateBase.gd"
class_name PlayerJump

func Enter():
	super()
	AnimatedSprite.play("PlayerJump")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if Player.is_on_floor():
		Player.velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("ui_up") and Player.velocity.y < 0:
		Player.velocity.y = 0
	
	super(_delta)

	Player.velocity.x = input_vector * move_toward( input_vector * Player.velocity.x, MOVE_SPEED, 20)
		

	if Player.velocity.y > 0:
		Transitioned.emit(self, "PlayerFall")
#	elif InputBuffer.is_action_press_buffered("sword_stab"):
#		Transitioned.emit(self, "PlayerSwordStab")
#	elif player.is_on_wall_only():
#		Transitioned.emit(self, "PlayerWallSlide")
	
