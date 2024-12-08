extends CharacterBody2D

@onready var lufa = $lufa
@onready var pocisk = preload("res://glowne/pocisk.tscn")
@onready var tors = $tors
@onready var nogi = $nogi

var strona := 1
var health := 100
var kierunek := 1.0

var aktualny_sufit : Area2D
var aktualna_podloga : Area2D

func _physics_process(delta):
	if health <= 0:
		queue_free()
	if Input.is_action_pressed("right_02"):
		nogi.flip_h = false
		tors.flip_h = false
		tors.offset.x = 0
		lufa.position = Vector2(30,-33)
		strona = 1
		kierunek = 1.0
		nogi.play("chodzenie")
	elif Input.is_action_pressed("left_02"):
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
		
		if Input.is_action_pressed("up_02"):
			
			velocity.y -= 500
	else:
		nogi.play("skok")
		velocity.y += 10
		
	if Input.is_action_just_pressed("shoot_02"):
		tors.play("strzal")
		var pocisk_nowy = pocisk.instantiate()
		get_tree().root.add_child(pocisk_nowy)
		pocisk_nowy.strona = strona
		pocisk_nowy.global_position = lufa.global_position
		pocisk_nowy.set_collision_mask_value(1,true)
	move_and_slide()
	if Input.is_action_just_pressed("down_02"):
		print("na dol")
		if aktualna_podloga:
			aktualna_podloga.wylacz_kolizje(4)
	
	
	
func _on_area_2d_area_entered(area):
	if aktualna_podloga == area:
		aktualna_podloga.wlacz_kolizje(4)
	else:
		aktualna_podloga = area
	
func _on_strefa_sufitu_area_entered(area):
	aktualny_sufit = area
	aktualny_sufit.wylacz_kolizje(4)
