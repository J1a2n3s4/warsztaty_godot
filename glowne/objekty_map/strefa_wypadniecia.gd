extends Area2D



func _on_body_entered(body):
	body.health = 0
