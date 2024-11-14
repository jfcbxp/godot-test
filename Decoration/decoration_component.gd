extends Node2D
class_name DecorationComponent

@export_category("Variables")
@export var textures_list: Array[String]

func _ready() -> void:
	for children in get_children():
		if children is Sprite2D:
			children.texture = load(textures_list.pick_random())
