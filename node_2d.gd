extends Node2D

@onready var _menu_music = $menuMusic

func _on_ready() -> void:
	_menu_music.play()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
