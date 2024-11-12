extends CharacterBody2D
class_name BaseCharacter

@export_category("Variables")
@export var _move_speed: float = 128.0
@export var _left_attack_name: String = ""
@export var _right_attack_name: String = ""

@export_category("Objects")
@export var _animation_player: AnimationPlayer
@export var _sprite2D: Sprite2D


var _can_attack: bool = true
var _attack_animation_name: String 


func _physics_process(delta: float) -> void:
	_move()
	_attack()
	_animate()


func _move() -> void:
		var _direction: Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")

		velocity = _direction * _move_speed

		move_and_slide()
		
func _attack() -> void:
	if Input.is_action_just_pressed("left_attack") and _can_attack:
		_can_attack = false
		_attack_animation_name = _left_attack_name
		set_physics_process(false)
		
	if Input.is_action_just_pressed("right_attack") and _can_attack:
		_can_attack = false
		_attack_animation_name = _right_attack_name
		set_physics_process(false)
		
func _animate() -> void:
	if velocity.x > 0:
		_sprite2D.flip_h = false
		
	if velocity.x < 0:
		_sprite2D.flip_h = true
		
	if _can_attack == false:
		_animation_player.play(_attack_animation_name)
		return
	
	if velocity:
		_animation_player.play("run")
		return

	_animation_player.play("idle")


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack_axe" or anim_name == "attack_hammer":
		_can_attack = true
		set_physics_process(true)