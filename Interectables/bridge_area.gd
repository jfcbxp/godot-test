extends Area2D
class_name BridgeArea



func _on_body_entered(body: Node2D) -> void:
	if body is BaseCharacter:
		body.update_collision_layer_mask("in")



func _on_body_exited(body: Node2D) -> void:
	if body is BaseCharacter:
		body.update_collision_layer_mask("out")
