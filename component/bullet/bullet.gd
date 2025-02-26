extends Area2D

func _physics_process(delta: float) -> void:
	position.x += 10


func _on_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent.is_in_group("ship1") or parent.is_in_group("ship2"):
		queue_free()
