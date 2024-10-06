extends LimboState

@export var _character: Character
@export var _body: CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _setup() -> void:
	_character = agent.get_node("Character")
	_body = agent as CharacterBody3D


func _enter() -> void:
	_character.play(KayKitCharacter.Anim.RUN_B)

func _update(delta: float) -> void:
	var dir = Input.get_vector("right", "left", "down", "up")
	if dir.is_zero_approx():
		dispatch(&"idle")
		return
	
	
	var target_velocity = Vector3(dir.x, 0, dir.y) * 5.0
	_character.face(target_velocity)
	_body.velocity = _body.velocity.move_toward(target_velocity, delta * 30.0)
	_body.move_and_slide()
