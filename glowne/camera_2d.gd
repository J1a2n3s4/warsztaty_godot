extends Camera2D

@onready var gracz_01 = $"../Gracz01"
@onready var gracz_02 = $"../Gracz02"

var obu_zyje := true

func _process(delta):
	var dystans
	if obu_zyje:
		dystans = gracz_01.global_position.distance_to(gracz_02.global_position)
	else:
		dystans = 1000
	zoom.x = 1/(dystans*0.003)
	zoom.y = 1/(dystans*0.003)
	
	zoom = clamp(zoom, Vector2(1,1), Vector2(3,3))
	
	
	if obu_zyje:
		position = lerp(position, (gracz_01.global_position+gracz_02.global_position)*0.5, 3*delta)
