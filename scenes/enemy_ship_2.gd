extends Node2D

@onready var _animated_sprite = $Area2D/AnimatedSprite2D

const ANIMATION_STATES = {
	MOVE = "enemy_move2" #DESTROYED = "destroy"
}

func _on_ready() -> void:
	_animated_sprite.play(ANIMATION_STATES.MOVE)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		var level = get_parent()
		level.add_score(10)
		queue_free()
