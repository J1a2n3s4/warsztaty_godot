extends CharacterBody2D

@onready var lufa = $lufa
@onready var pocisk = preload("res://glowne/pocisk.tscn")
@onready var tors = $tors
@onready var nogi = $nogi

var strona := 1

var kierunek := 1.0

func _physics_process(delta):

	if Input.is_action_pressed("right_01"):
		nogi.flip_h = false
		tors.flip_h = false
		tors.offset.x = 0
		lufa.position = Vector2(30,-33)
		strona = 1
		kierunek = 1.0
		nogi.play("chodzenie")
	elif Input.is_action_pressed("left_01"):
		nogi.flip_h = true
		tors.flip_h = true
		tors.offset.x = -16
		lufa.position = Vector2(-15,-33)
		kierunek = -1.0
		strona = -1
		nogi.play("chodzenie")
	else:
		nogi.play("stanie")
		kierunek = 0.0
	if is_on_floor():
		
		velocity.x = lerp(velocity.x, kierunek*100, 7*delta)
		
		if Input.is_action_pressed("up_01"):
			
			velocity.y -= 500
	else:
		nogi.play("skok")
		velocity.y += 10
		
	if Input.is_action_just_pressed("shoot_01"):
		tors.play("strzal")
		var pocisk_nowy = pocisk.instantiate()
		get_tree().root.add_child(pocisk_nowy)
		pocisk_nowy.strona = strona
		pocisk_nowy.global_position = lufa.global_position
		pocisk_nowy.set_collision_mask_value(2,true)
	move_and_slide()
