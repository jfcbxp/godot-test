extends CharacterBody2D
class_name Sheep

@export_category("Variables")
@export var move_speed: float = 128.0

var direction: Vector2


func _ready() -> void:
	direction  = get_direction()

func _physics_process(delta: float) -> void:
	velocity = direction * move_speed
	move_and_slide()
	animate()

func animate() -> void:
	if velocity.x > 0:
		
	
func get_direction() -> Vector2:
	return [
		Vector2(-1,0),
		Vector2(1,0),
		Vector2(-1,-1),
		Vector2(0,-1),
		Vector2(1,-1),
		Vector2(-1,1),
		Vector2(0,1),
		Vector2(1,1),
		Vector2.ZERO
	].pick_random()
