extends Node2D

@onready var _score_collected_label = $scoreCollected
@onready var _main_music = $mainMusic

var pre_enemyShip = preload("res://scenes/enemy_ship.tscn")
var pre_enemyShip2 = preload("res://scenes/enemy_ship_2.tscn")
var score_collected = 0


func _on_ready() -> void:
	_main_music.play()


func add_score(points: int) -> void:
	score_collected += points
	_score_collected_label.text = str(score_collected)

func _on_timer_timeout() -> void:
	randomize()
	var random_enemy = round(randi_range(1,2))
	
	if random_enemy == 1:
		var enemyShip = pre_enemyShip.instantiate()
		self.call_deferred("add_child", enemyShip)
		enemyShip.position.y = round(randi_range(-300,300))
		enemyShip.add_to_group("ship1")
	elif random_enemy == 2:
		var enemyShip2 = pre_enemyShip2.instantiate()
		self.call_deferred("add_child", enemyShip2)
		enemyShip2.position.y = round(randi_range(-300,300))
		enemyShip2.add_to_group("ship2")
		
