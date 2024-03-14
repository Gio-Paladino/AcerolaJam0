extends CharacterBody2D

var robot_direction = 1

var start_pos : Vector2

func _ready():
	print("start saved")
	start_pos.x = position.x
	start_pos.y = position.y


func _on_death_box_body_entered(body):
	if body == self:
		print("returned")
		position.x = start_pos.x 
		position.y = start_pos.y
