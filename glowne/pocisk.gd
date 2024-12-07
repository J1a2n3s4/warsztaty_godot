extends CharacterBody2D

var strona := 0

func _physics_process(delta):
	velocity.x = strona * 100
	move_and_collide(velocity)


func _on_timer_timeout():
	queue_free()
