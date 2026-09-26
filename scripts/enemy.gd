extends Area2D

@export var speed: float = 110.0
@export var damage: int = 7

var player: CharacterBody2D = null

func _physics_process(delta):
	if player:
		var direction = global_position.direction_to(player.global_position)

		$WallCheck.target_position = direction * speed * delta

		if not $WallCheck.is_colliding():
			global_position += direction * speed * delta


func _on_body_entered(body):
	if body is CharacterBody2D:
		player = body
		$DamageTimer.start()
		print("PLAYER DETECTED!")


func _on_body_exited(body):
	if body == player:
		player = null
		$DamageTimer.stop()
		print("PLAYER LOST!")


func _on_damage_timer_timeout() -> void:
	if player:
		player.HEALTH -= damage
		player.HEALTH = clamp(player.HEALTH, 0, 120)
		print("PLAYER HEALTH:", player.HEALTH)
		if player.HEALTH <=0:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
