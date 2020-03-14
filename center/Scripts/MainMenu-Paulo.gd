extends Node2D

var background_size = Vector2(2048, 1365)
onready var background = $Background

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_size_change")
	resize_background(get_viewport_rect().size)
	
func on_size_change():
	resize_background(get_viewport_rect().size)
	
func resize_background(view_size):
	var src_width = background_size.x
	var src_height = background_size.y
	var src_ratio = src_width / src_height

	var width = view_size.x
	var height = view_size.y
	var ratio = width / height
	
	var crop_height = 0
	var crop_width = 0
	
	var new_width = 0
	var new_height = 0

	if (src_height > src_width):
		new_height = width / src_ratio
		crop_height = new_height - height
	else:
		new_width = height * src_ratio
		crop_width = new_width - width
		
	background.get_rect().size.x = 200
	background.get_rect().size.y = 100
	
	#background.position = Vector2(view_size.x / 2, view_size.y / 2)

func _on_ButtonChange_pressed():
	get_tree().change_scene("res://Scenes/Stage.tscn")
