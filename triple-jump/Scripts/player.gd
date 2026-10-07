extends CharacterBody2D

var speed = 0 # the player's speed
var max_speed = 5 # the player's max speed
var acceleration = 0.1 # the player's acceleration
var gravitational_force = 1 # the ammount of gravity
var gravity = 0 # the speed at whitch the player falls: -1 is up and 1 is down
var sprint_unlocked = false
var on_platform = false

func _process(delta: float) -> void:
	move() # triggers move function
	fall() # triggers fall function

func move(): # allows the player to move left and right || use speed and acceleration for left/right movement
	if Input.is_action_pressed("left"):
		speed -= acceleration # accelerates player left
		self.position += Vector2(speed,0)
	elif(speed<0-acceleration):
		speed += acceleration
		
		pass
	if Input.is_action_pressed("right"):
		speed += acceleration
		self.position += Vector2(speed,0)
	elif(speed>0+acceleration):
		speed -= acceleration
	if(speed>max_speed):
		speed = max_speed
	if(speed<max_speed*-1):
		speed = max_speed*-1
	if Input.is_action_just_pressed("Sprint")&&sprint_unlocked==true:
		speed = max_speed

func fall(): # allows the player to move up and down || use gravity for the falling and jumping
	gravity += 0.2 * gravitational_force
	self.position += Vector2(0,gravity)
	if (self.collision_layer): #make collision work
		pass
	if Input.is_action_pressed("jump"): #&&on_platform==true
		gravity -= 0.5
		on_platform = false
