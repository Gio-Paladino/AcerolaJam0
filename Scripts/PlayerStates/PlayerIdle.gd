extends "res://Scripts/PlayerStates/PlayerStateBase.gd"
class_name PlayerIdle

func Enter():
	super()
	AnimatedSprite.play("PlayerIdle")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	super(_delta)
	Player.velocity.x = move_toward(Player.velocity.x, 0, 60)
	Player.move_and_slide()
	
	if input_vector != 0 and Player.is_on_floor():
		Transitioned.emit(self, "PlayerRun")
	elif Player.is_on_floor() and Input.is_action_pressed("ui_up"): #InputBuffer.is_action_press_buffered("ui_up"):
		Player.NUM_JUMPS += 1
		Transitioned.emit(self, "PlayerJump")
	elif Player.velocity.y > 0:
		Transitioned.emit(self, "PlayerFall")
#	elif InputBuffer.is_action_press_buffered("sword_attack"):
#		Transitioned.emit(self, "PlayerSwordAttack")
