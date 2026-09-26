extends Area2D

func _on_body_entered(body):
	body.HEALTH+=20
	body.HEALTH = clamp(body.HEALTH,0,120)
	queue_free()
	print(body.HEALTH)
