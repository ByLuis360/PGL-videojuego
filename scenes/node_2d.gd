extends Node2D

var pre_enemyShip = preload("res://scenes/enemy_ship.tscn")
var pre_enemyShip2 = preload("res://scenes/enemy_ship_2.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
		
