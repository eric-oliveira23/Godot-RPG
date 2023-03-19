extends CharacterBody2D

@export var move_speed: float = 50.0;

#Guarda referência de objetos
@export var sprite: Sprite2D = null
@export var animation: AnimationPlayer = null

func _physics_process(_delta):
	var direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down"),
	).normalized()
	
	velocity = move_speed * direction
	move_and_slide()
	
	check_orientation()
	animate()

func check_orientation():
	if velocity.x > 0:
		sprite.flip_h = false;
		
	if velocity.x < 0:
		sprite.flip_h = true;
		
func animate():
	if velocity != Vector2.ZERO:
		animation.play("walk")
		return
		
	animation.play("idle")
	
