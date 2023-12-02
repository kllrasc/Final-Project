extends CharacterBody2D

var initial_speed = 300.0

func _ready():
	velocity = Vector2(0, initial_speed*randf()).rotated(2*PI*randf())

func _physics_process(delta):
	move_and_slide()
	position.x= wrapf(position.x, 0, 1152)
	position.y= wrapf(position.y,0, 648)
	if get_child_count() == 0:
		Global.update_lives(-1)
		var camera = get_node_or_null("/root/Game/Camera")
		if camera != null:
			camera.add_trauma(3.0)
