extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var _hsm: LimboHSM = $PlayerHSM
@onready var _idle_state: LimboState = $PlayerHSM/IdleState
@onready var _move_state: LimboState = $PlayerHSM/MoveState
@onready var _attack_state: LimboState = $PlayerHSM/AttackState
@onready var _jump_state: LimboState = $PlayerHSM/JumpState


func _ready() -> void:
	_init_state_machine()


func _init_state_machine() -> void:
	_hsm.add_transition(_idle_state, _move_state, &"move")
	_hsm.add_transition(_move_state, _idle_state, &"idle")
	_hsm.add_transition(_idle_state, _attack_state, &"attack")
	_hsm.add_transition(_move_state, _attack_state, &"attack")
	_hsm.add_transition(_idle_state, _jump_state, &"jump")
	_hsm.add_transition(_move_state, _jump_state, &"jump")
	_hsm.add_transition(_jump_state, _idle_state, &"idle")
	_hsm.add_transition(_attack_state, _idle_state, _hsm.EVENT_FINISHED)

	_hsm.initialize(self)
	_hsm.set_active(true)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("attack"):
		_hsm.dispatch(&"attack")
	elif Input.is_action_just_pressed("jump"):
		_hsm.dispatch(&"jump")


func _on_hit():
	_hsm.dispatch(&"hit")