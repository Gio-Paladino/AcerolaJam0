extends Node2D

class_name Terminal

@onready var Interact : Interactable = get_node("Interactable")
@onready var particle : GPUParticles2D = get_node("GPUParticles2D")
@onready var actTimer : Timer = get_node("ActTimer")

signal active

# Called when the node enters the scene tree for the first time.
func _ready():
	Interact.on_interact.connect(activated)
	actTimer.timeout.connect(timeout)
	actTimer.one_shot = true
	particle.emitting = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activated():
	particle.emitting = true
	actTimer.start()
	active.emit()

func timeout():
	particle.emitting = false
	actTimer.wait_time = 1
