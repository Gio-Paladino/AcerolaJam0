extends RigidBody2D

@onready var Particles : GPUParticles2D = get_node("GPUParticles2D")
@onready var DeathTimer : Timer = get_node("DeathTimer")
@onready var Sprite : Sprite2D = get_node("Sprite2D")
@onready var Collision : CollisionShape2D = get_node("CollisionShape2D")
@onready var InteractMgr : Interactable = get_node("Interactable")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	Particles.emitting = false
	DeathTimer.timeout.connect(timeout)
	InteractMgr.on_interact.connect(BoxBreak)
	
func _physics_process(_delta):
	apply_force(Vector2(0, gravity), Vector2(0,1))

func timeout():	
	self.queue_free()
	
func BoxBreak():
	Particles.emitting = true
	Sprite.visible = false
	Collision.disabled = true
	DeathTimer.one_shot = true
	DeathTimer.start()


