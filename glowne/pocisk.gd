extends CharacterBody2D

var strona := 0

func _physics_process(delta):
	velocity.x = strona * 100
	var collider = move_and_collide(velocity)
	if collider:
		collider.get_collider().health -= 25
		queue_free()
func _on_timer_timeout():
	queue_free()
