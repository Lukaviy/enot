class_name Portal
extends Area2D

@export var is_in: bool

@onready var spawn_position_node = $SpawnPosition

signal player_entered(body: Node2D, portal: Portal)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_spawn_position() -> Vector2:
	return spawn_position_node.global_position

func _on_body_entered(body: Node2D):
	print("Body entered!")
	if body.is_in_group("Player"):
		player_entered.emit(body, self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
