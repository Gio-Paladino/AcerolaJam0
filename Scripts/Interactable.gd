extends Area2D

class_name Interactable

var current_interaction: Interactable

signal on_interact;

func _on_area_entered(area):
	print(str(area) + "entered")
	current_interaction = area

func _on_area_exited(area):
	if current_interaction == area:
		print(str(area) + "exited")
		current_interaction = null


func interact() -> void:
	if current_interaction != null:
		current_interaction.execute_interaction()

func execute_interaction() -> void:
	print("Interaction not defined :: Interactable.gd")

func _interact() -> void:
	on_interact.emit()
	
