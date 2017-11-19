extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var pos = get_pos()
	if Input.is_action_pressed("ui_left"):
		pos.x -= 1.0
	elif Input.is_action_pressed("ui_right"):
		pos.x += 1.0
	if Input.is_action_pressed("ui_up"):
		pos.y -= 1.0
	elif Input.is_action_pressed("ui_down"):
		pos.y += 1.0
	set_pos(pos)
