extends RigidBody2D

@onready var Particles : GPUParticles2D = get_node("GPUParticles2D")
@onready var DeathTimer : Timer = get_node("DeathTimer")
@onready var Sprite : Sprite2D = get_node("Sprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	Particles.emitting = false
	DeathTimer.timeout.connect(timeout)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		Particles.emitting = true
		Sprite.visible = false
		DeathTimer.one_shot = true
		DeathTimer.start()
		
	
func timeout():	
	self.queue_free()
