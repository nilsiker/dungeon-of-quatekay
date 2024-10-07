extends LimboState

@export var _character: Character
@export var _body: CharacterBody3D

const JUMP_FORCE := 6.0

# Called when the node enters the scene tree for the first time.
func _setup() -> void:
	_character = agent.get_node("Character")
	_body = agent as CharacterBody3D


func _enter() -> void:
	_character.play(KayKitCharacter.Anim.JUMP)
	_body.velocity.y = JUMP_FORCE


func _update(delta: float) -> void:
	var dir = Input.get_vector("right", "left", "down", "up")

	var target_velocity = Vector3(dir.x, 0, dir.y) * 5.0
	if dir: _character.face(target_velocity)


	var y = _body.velocity.y - 9.82 * delta
	target_velocity.y = y
	_body.velocity = _body.velocity.move_toward(target_velocity, delta * 30.0)

	_body.move_and_slide()

	if _body.is_on_floor():
		dispatch(&"idle")
