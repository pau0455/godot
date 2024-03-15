extends CharacterBody2D

#Tiempo de salto
var coyote_time = 0.1
var can_jump = false

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d = $Sprite2D




# Get the gravity / RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# gravity.
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"

	if  not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	
	if is_on_floor() and can_jump == false:
		can_jump = true
	elif can_jump == true and $coyoteTimer.is_stopped():  
		$coyoteTimer.start(coyote_time)

	# jump.
	
	if Input.is_action_just_pressed("jump") and can_jump == true:
		velocity.y = JUMP_VELOCITY
		can_jump = false
		
	# movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	

func _on_coyote_timer_timeout():
	can_jump = false
	pass # Replace with function body.
