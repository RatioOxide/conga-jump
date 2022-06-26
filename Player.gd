extends KinematicBody2D

const UP = Vector2(0,-2)
const GRAVITY = 15
const MAXFALLSPEED = 400
const MAXSPEED = 100
const JUMPFORCE = 225
const ACCEL = 60
var motion = Vector2()
var facing_right = true
var Score = 0

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h  = true
	
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("Running")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$AnimationPlayer.play("Running")
	else:
		motion.x = lerp(motion.x,0,0.2)
		$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
			$AnimationPlayer.play("Jumping")
			
	
	
		
	motion = move_and_slide(motion,UP)


func _on_Coin_body_entered(body):
	Score += 1
	print (Score)
	pass # Replace with function body.
