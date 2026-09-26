extends CharacterBody2D

var SPEED = 150.0
var HEALTH = 60.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: ProgressBar = $HealthBar

func _ready() -> void:
	health_bar.max_value = 120
	health_bar.value = HEALTH

func _physics_process(delta: float) -> void:
	process_movement()
	health_bar.value = HEALTH

func process_movement() -> void:
	var direction := Input.get_vector("left", "right", "up", "down")

	velocity = direction * SPEED
	move_and_slide()
	play_animation(direction)

func play_animation(dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play("run")
	elif dir.x < 0:
		animated_sprite_2d.play("run")
	elif dir.y < 0:
		animated_sprite_2d.play("run")
	elif dir.y > 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
