extends CharacterBody2D

# variables that describe the state of the player
var NUM_JUMPS = 0
var player_direction = 1

var start_pos : Vector2

@onready var interactionMgr = get_node("Interactable")
#@onready var CrouchRayCast = get_node("CrouchRayCast")

func _ready():
	print("start saved")
	start_pos.x = position.x
	start_pos.y = position.y

func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		interactionMgr.interact()


func _on_death_box_body_entered(body):
	if body == self:
		print("returned")
		position.x = start_pos.x 
		position.y = start_pos.y
