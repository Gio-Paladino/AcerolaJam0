extends "res://Scripts/PlayerStates/PlayerStateBase.gd"
class_name PlayerInactive

func Enter():
	super()
	AnimatedSprite.play("PlayerIdle")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	Player.velocity.y += gravity * _delta
	Player.velocity.x = move_toward(Player.velocity.x, 0, 60)
	Player.move_and_slide()
	
	if Input.is_action_just_pressed("switch"):
		Transitioned.emit(self, "PlayerIdle")
