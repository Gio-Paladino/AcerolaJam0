extends CharacterBody2D

# variables that describe the state of the player
var NUM_JUMPS = 0
var player_direction = 1

@onready var interactionMgr = get_node("Interactable")
#@onready var CrouchRayCast = get_node("CrouchRayCast")

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		interactionMgr.interact()
