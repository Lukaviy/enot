class_name Main
extends Node2D

const Portal = preload("res://Scenes/portal.gd")
const Wall = preload("res://Scenes/wall.gd")

var BluePortal = preload("res://Scenes/in_portal.tscn")
var OrangePortal = preload("res://Scenes/out_portal.tscn")

var blue_portal_instance: Portal
var orange_portal_instance: Portal

@onready var Portals = $Portals

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func portal_entered(body: Node2D, portal: Portal):
	print("Portal entered! ", portal.is_in)

	if !blue_portal_instance || !orange_portal_instance:
		return

	if !portal.is_in:
		body.position = blue_portal_instance.get_spawn_position()
	else:
		body.position = orange_portal_instance.get_spawn_position()

func get_blue_portal() -> Node2D:
	if blue_portal_instance:
		return blue_portal_instance

	blue_portal_instance = BluePortal.instantiate()
	blue_portal_instance.player_entered.connect(portal_entered)
	Portals.add_child(blue_portal_instance)
	return blue_portal_instance

func get_orange_portal() -> Node2D:
	if orange_portal_instance:
		return orange_portal_instance

	orange_portal_instance = OrangePortal.instantiate()
	orange_portal_instance.player_entered.connect(portal_entered)
	Portals.add_child(orange_portal_instance)
	return orange_portal_instance

func on_wall_clicked(wall: Wall, is_in:bool):
	var portal = get_blue_portal() if is_in else get_orange_portal()
	portal.transform = wall.transform
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
