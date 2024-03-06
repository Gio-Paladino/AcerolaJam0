extends Interactable

signal RobotActivated

func receive_interaction() -> void:
	RobotActivated.emit()
