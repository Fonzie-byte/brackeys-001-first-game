extends Node


var points = 0
var score_text : ScoreText
var coin_pouch : CoinPouch

var respawn_position : Vector2
var player : Player


func add_point(add_score = 1):
	points += add_score
	score_text.text = "Pts. " + str(points)


func respawn_player():
	player.position = respawn_position


func count_coins():
	print(str(coin_pouch.get_child_count()))
	
	if coin_pouch.get_child_count() <= 1:
		score_text.text = "ALL " + str(points) + "!!"
