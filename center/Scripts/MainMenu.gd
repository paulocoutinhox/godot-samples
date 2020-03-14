extends Node2D

onready var background = $Background

onready var screen_center = get_viewport_rect().size * 0.5
onready var background_aspect = get_aspect_ratio(background.get_rect().size)

func _ready():
  get_tree().get_root().connect("size_changed", self, "on_size_change")

func on_size_change():
  var view_size = get_viewport_rect().size
  recenter_game(view_size)
  resize_background(view_size)

func recenter_game(view_size):
  var new_center = view_size * 0.5
  position = new_center - screen_center
  
func resize_background(view_size):
  var new_aspect = get_aspect_ratio(view_size)

  if new_aspect > background_aspect:
	  background.get_rect().size.x = view_size.x
	  background.get_rect().size.y = view_size.x / background_aspect
  else:
	  background.get_rect().size.y = view_size.y
	  background.get_rect().size.x = view_size.y * background_aspect
	
  var new_center = view_size * 0.5
  var new_size_half = background.get_rect().size * 0.5

  background.position = screen_center - new_size_half
  
func get_aspect_ratio(size):
  return size.x / size.y
