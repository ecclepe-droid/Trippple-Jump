extends CharacterBody2D

var speed = 0 # the player's speed
var max_speed = 10 # the player's max speed
var acceleration = 0.04 # the player's acceleration
var gravitational_force = 2 # the ammount of gravity
var gravity = 0 # the speed at whitch the player falls: -1 is up and 1 is down
var sprint_unlocked = true
var on_floor = false
var movement = false

func _process(delta: float) -> void:
	if (position.y >= 500):
		reset_momentum_and_position()
	if(Input.is_action_just_pressed("Respawn")):
		reset_momentum_and_position()
	fall() # triggers fall function
	move() # triggers move function
	on_floor = false
func move(): # allows the player to move left and right || use speed and acceleration for left/right movement
	move_and_collide(Vector2(speed,0))
	
	if Input.is_action_pressed("left")&&(on_floor == true):
		speed -= acceleration # accelerates player left
		movement = true
	if Input.is_action_pressed("right")&&(on_floor == true):
		speed += acceleration # accelerates player right
		movement = true
		
	if (movement==false)&&(on_floor == true):
		decelerate()
	else:
		movement = false
	
	if(speed>max_speed):
		speed = max_speed # stops player from going above 10 speed
	elif(speed<max_speed*-1):
		speed = max_speed*-1 # stops player from going below -10 speed
		
	if Input.is_action_just_pressed("Sprint")&&sprint_unlocked==true&&on_floor==true:
		speed = max_speed

func fall(): # allows the player to move up and down || use gravity for the falling and jumping
	gravity += 0.2 * gravitational_force
	var collision = move_and_collide(Vector2(0,gravity))
	if collision:
		gravity = 0
		on_floor = true
	if Input.is_action_just_pressed("jump")&&on_floor == true:
		gravity -= 10
		on_floor = false

func reset_momentum_and_position():
	gravity = 0
	speed = 0
	position = Vector2 (0,0)
	movement = false
	print("You Died")

func decelerate():
	if(speed>0+acceleration):
		speed -= acceleration # accelerates player left until speed = 0
	elif(speed<0-acceleration): 
		speed += acceleration # accelerates player right until speed = 0
