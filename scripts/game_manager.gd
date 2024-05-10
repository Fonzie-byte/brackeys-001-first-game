extends Node


var points = 0
@onready var lbl_points = $lblPoints
#@onready var count_coin_timer = $CountCoinTimer

var respawn_position : Vector2
var player : Player
var coin_pouch : CoinPouch


func add_point(add_score = 1):
	points += add_score
	lbl_points.text = "You collected\n" + str(points) + " points!"
#	count_coin_timer.start()


func respawn_player():
	player.position = respawn_position


#func _on_count_coin_timer_timeout():
#	if coin_pouch.get_child_count() == 0:
#		lbl_points.text = "You collected\nALL " + str(points) + " points!!"


func count_coins():
	print(str(coin_pouch.get_child_count()))
	
	if coin_pouch.get_child_count() == 0:
		print("ALL")
		lbl_points.text = "You collected\nALL " + str(points) + " points!!"
	else:
		print("not all")
