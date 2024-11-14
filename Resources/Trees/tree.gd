extends StaticBody2D
class_name PhysicsTree

@export_category("Variables")
@export var health: int = 15
@export var animation:AnimationPlayer

var is_dead: bool = false
const _WOOD_COLLECTABLE: PackedScene = preload("res://Collectable/wood.tscn")

func _ready() -> void:
	health = randi_range(1,10)

func update_health(damage: Array) -> void:
	if is_dead:
		return
	
	health -= randi_range(damage[0],damage[1])
	
	if health <= 0:
		spawn_wood()
		is_dead = true
		animation.play("kill")
		return
		
	animation.play("hit")


func _on_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hit":
		animation.play("idle")
	
func spawn_wood() -> void:
	var wood_amount: int = randi_range(1,3)
	for i in wood_amount:
		var wood: CollectableComponent = _WOOD_COLLECTABLE.instantiate()
		wood.global_position = global_position + Vector2( randi_range(-32,32), randi_range(-32,32))
		get_tree().root.call_deferred("add_child",wood)
