extends Area2D


@onready var timer = $Timer
@onready var aud_hurt = $audHurt


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# Don't do anything if it's not a player
	if body.get_parent() != Player:
		pass

	Engine.time_scale = (1.0/3)
#	body.get_node("CollisionShape2D").queue_free()
	aud_hurt.play()
	timer.start()


func _on_timer_timeout():
	GameManager.respawn_player()
	Engine.time_scale = 1
