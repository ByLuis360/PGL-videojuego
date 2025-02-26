extends Node2D

@onready var _animated_sprite = $Area2D/enemy
@onready var _animation_config = $Area2D/AnimationPlayer

const ANIMATION_STATES = {
	MOVE = "enemy", DESTROYED = "destroy"
}
# Called when the node enters the scene tree for the first time.
var enemy_move = ANIMATION_STATES.MOVE
var enemy_destroyed = ANIMATION_STATES.DESTROYED


func _on_ready() -> void:
	_animated_sprite.play(enemy_move)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		var level = get_parent()
		level.add_score(30)
		queue_free()
		
	
