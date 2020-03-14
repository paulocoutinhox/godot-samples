extends Node2D

onready var bg = $ParallaxBackground

var speed = 400
var offset_x = 0

func _process(delta):
	offset_x -= speed * delta
	bg.scroll_offset = Vector2(offset_x, 0)


func _on_ButtonChange_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
