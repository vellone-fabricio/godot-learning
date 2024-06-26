extends CharacterBody2D

const MAX_SPEED = 125
const ACC_SMOOTHING = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mov_vector = get_movement_vector()
	var direction = mov_vector.normalized()
	
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACC_SMOOTHING))
	move_and_slide()


func get_movement_vector():
	var x_mov = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_mov = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return Vector2(x_mov, y_mov)
