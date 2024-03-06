extends Area2D

class_name Interactable

var current_interaction: Interactable

func _on_area_entered(area):
	current_interaction = area

func _on_area_exited(area):
	if current_interaction == area:
		current_interaction = null


func interact() -> void:
	if current_interaction != null:
		current_interaction.execute_interaction()

func execute_interaction() -> void:
	print("Interaction not defined :: Interactable.gd")
