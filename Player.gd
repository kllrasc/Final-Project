extends CharacterBody2D


var speed = 40
var max_speed = 200
var rotate_speed = 0.3
var nose = Vector2(0,-60)
var bullet = load("res://Bullet/bullet.gd")

func get_input():
	var to_return = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		to_return += Vector2(0,-1)
		$Exhaust.show()
		if Input.is_action_pressed("left"):
			rotation -= rotate_speed
			if Input.is_action_pressed("right"):
				rotation += rotate_speed
				return to_return.rotated(rotation)

func _physics_process(_delta):
	if Input.is_action_pressed("left"):
		rotation -= rotate_speed
	if Input.is_action_pressed("right"):
		rotation += rotate_speed
	if Input.is_action_pressed("forwards"):
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
		
	position.x = wrapf(position.x,0,1152)
	position.y = wrapf(position.y,0,648)
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	if Input.is_action_just_pressed("Shoot"):
		var Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var bullet = bullet.instantiate()
			bullet.rotation = rotation
			bullet.global_position = global_position + nose.rotated(rotation)
			Effects.add_child(bullet)
		
	move_and_slide()
