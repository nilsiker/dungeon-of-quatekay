extends LimboState

@export var _character: Character
@export var _body: CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _setup() -> void:
	_character = agent.get_node("Character")
	_body = agent as CharacterBody3D


func _enter() -> void:
	_character.play(KayKitCharacter.Anim.IDLE)


func _update(delta: float) -> void:
	var dir = Input.get_vector("right", "left", "down", "up")
	if not dir.is_zero_approx():
		dispatch(&"move")

	_body.velocity = _body.velocity.move_toward(Vector3.ZERO, delta * 30.0)
	_body.move_and_slide()

	if not _body.is_on_floor():
		dispatch(&"jump")
