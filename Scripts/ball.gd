extends RigidBody2D

const SPEED_UP = 400
const MAX_SPEED = 30000

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized()*min(speed+SPEED_UP*delta, MAX_SPEED*delta)
			set_linear_velocity(velocity)
