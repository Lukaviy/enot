class_name Wall
extends StaticBody2D

signal wall_clicked(wall:Wall, is_in:bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_normal() -> Vector2:
	return transform * Vector2(0, -1)

func _input_event(viewport:Viewport, event:InputEvent, shape_idx:int):
	if (event.is_action_pressed("Left Mouse Click")):
		wall_clicked.emit(self, true)
	if (event.is_action_pressed("Right Mouse Click")):
		wall_clicked.emit(self, false)
	pass
