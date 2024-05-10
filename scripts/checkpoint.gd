extends Node2D


@export var spawn_point = false
var activated = false
@onready var sprite = $Sprite2D
@onready var aud_activated = $AudioStreamPlayer2D


func activate():
	# Don't activate multiple times
	if activated:
		pass

	# If not activated, set respawn point
	GameManager.respawn_position = self.global_position
	activated = true
	aud_activated.play()
	# Change sprite from the blue botte to the purple bottle next to it
	sprite.region_rect = Rect2(16, 128, 16, 16)


func _on_area_2d_area_entered(area):
	# Activate if inactive and touching with player
	if !activated and area.get_parent() is Player:
		activate()
