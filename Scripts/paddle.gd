extends KinematicBody2D

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var mouse_x = get_viewport().get_mouse_pos().x;
	set_pos(Vector2(mouse_x,get_pos().y))