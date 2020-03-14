extends Node2D

onready var background = $Background
onready var screen_center = get_viewport_rect().size * 0.5
onready var background_size = background.get_rect().size * background.scale
onready var background_aspect = get_aspect_ratio(background_size)

func _ready():
	get_tree().get_root().connect("size_changed", self, "on_size_change")
	on_size_change()
	
func on_size_change():
	var view_size = get_viewport_rect().size
	resize_background(view_size)
	
func resize_background(view_size):
	var new_aspect = get_aspect_ratio(view_size)
	var new_scale = 0.5
	
	if new_aspect > background_aspect:
		new_scale = view_size.x / background_size.x
	else:
		new_scale = view_size.y / background_size.y
	
	new_scale *= 0.5

		
	background.set_scale(Vector2(new_scale, new_scale))
	
func get_aspect_ratio(size):
	return size.x / size.y
	
func _on_ButtonChange_pressed():
	get_tree().change_scene("res://Scenes/Stage.tscn")
