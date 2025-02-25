extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ANIMATION_STATES = {
	MOVE = "move", SHOOT = "shoot"
}
const CONTROLS_KEYS = {
	SPACE = "ui_accept", UP = "ui_up", DOWN = "ui_down"
}

var current_animation = ANIMATION_STATES.MOVE
var shoot_animation = ANIMATION_STATES.SHOOT
var direction_up = CONTROLS_KEYS.UP 
var direction_down = CONTROLS_KEYS.DOWN 
var pre_bullet = preload("res://component/bullet/bullet.tscn")
var ready_to_shoot = true

func _on_ready() -> void:
	_animated_sprite.play(current_animation)

func shoot():
	if ready_to_shoot:
		ready_to_shoot = false
		_animated_sprite.play(shoot_animation)
		var bullet = pre_bullet.instantiate()
		get_parent().call_deferred("add_child", bullet)
		bullet.position.x = self.position.x + 50
		bullet.position.y = self.position.y
		await(get_tree().create_timer(1).timeout)
		_animated_sprite.play(current_animation)
		ready_to_shoot = true
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed(CONTROLS_KEYS.SPACE):
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(direction_up, direction_down)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	
