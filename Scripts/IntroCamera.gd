extends Camera2D

var xSpeed = 5

@onready var Part : GPUParticles2D = get_node("TrailParticles")
@onready var Part2 : AnimatedSprite2D = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	Part2.play("default")
	var tim : Timer = get_node("CameraTimer")
	tim.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += xSpeed
	pass


func _on_camera_timer_timeout():
	xSpeed = 0
	Part.emitting = false
	Part2.visible = false
	pass # Replace with function body.
