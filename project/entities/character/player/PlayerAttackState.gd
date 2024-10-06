extends LimboState

@export var _character: Character
@export var _body: CharacterBody3D
@export var _fighter: Fighter


# Called when the node enters the scene tree for the first time.
func _setup() -> void:
	_character = agent.get_node("Character")
	_body = agent as CharacterBody3D
	add_event_handler(&"hit", _on_hit)

	_character.anim_finished.connect(_on_anim_finished)

func _enter() -> void:
	_character.play(KayKitCharacter.Anim.ATTACK_1H_CHOP)


func _update(delta: float) -> void:
	_body.velocity = _body.velocity.move_toward(Vector3.ZERO, delta * 30.0)
	_body.move_and_slide()


func _on_anim_finished(_anim_name):
	if not is_active(): return

	dispatch(EVENT_FINISHED)


func _on_hit(_cargo = null):
	_fighter.hit()