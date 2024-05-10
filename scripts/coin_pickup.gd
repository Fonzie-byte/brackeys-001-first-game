extends Area2D


@onready var animation_player = $AnimationPlayer
@onready var player = %Player


func _on_body_entered(body):
	GameManager.add_point()
	animation_player.play("pickup")


func count_coins():
	print("Asking to count")
	GameManager.count_coins()
