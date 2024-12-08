extends Area2D

@onready var podloga = $".."


func wylacz_kolizje(id_kolizji):
	podloga.set_collision_layer_value(id_kolizji, false)

func wlacz_kolizje(id_kolizji):
	podloga.set_collision_layer_value(id_kolizji, true)
