extends CharacterBody2D

var robot_direction = 1

@onready var interactionMgr = get_node("Interactable")
@onready var animation = get_node("AnimatedSprite2D")

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		interactionMgr.interact()
