extends Area2D

func _on_body_entered(body):
	body.SPEED+=20
	queue_free()
	print(body.SPEED)
