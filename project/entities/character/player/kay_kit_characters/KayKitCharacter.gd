@tool
extends Node3D
class_name KayKitCharacter

signal anim_footstep
signal anim_finished(animation_name: String)
signal hit

@export_group("Equipment")
@export var show_mainhand: bool:
	get: return _mainhand.visible if _mainhand else false
	set(value): if _mainhand: _mainhand.visible = value
@export var show_offhand_A: bool:
	get: return _offhand_A.visible if _offhand_A else false
	set(value): if _offhand_A: _offhand_A.visible = value
@export var show_offhand_B: bool:
	get: return _offhand_B.visible if _offhand_B else false
	set(value): if _offhand_B: _offhand_B.visible = value
@export var show_twohand: bool:
	get: return _twohand.visible if _twohand else false
	set(value): if _twohand: _twohand.visible = value
@export var show_hat: bool:
	get: return _hat.visible if _hat else false
	set(value): if _hat: _hat.visible = value
@export var show_cape: bool:
	get: return _cape.visible if _cape else false
	set(value): if _cape: _cape.visible = value
@export var show_special: bool:
	get: return _special.visible if _special else false
	set(value): if _special: _special.visible = value

@export_group("Bones (Do not edit)")
@export var _mainhand: BoneAttachment3D
@export var _offhand_A: BoneAttachment3D
@export var _offhand_B: BoneAttachment3D
@export var _twohand: BoneAttachment3D
@export var _hat: BoneAttachment3D
@export var _cape: BoneAttachment3D
@export var _special: BoneAttachment3D

@export var _anim: AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_anim.animation_finished.connect(func(anim_name):
		anim_finished.emit(anim_name)
	)

func play(animation: String):
	_anim.play(animation, .25)

func emit_footstep():
	anim_footstep.emit()

func emit_hit():
	hit.emit()

class Anim:
	# MOVEMENT
	const IDLE = "Idle"
	const WALK_A = "Walking_A"
	const WALK_B = "Walking_B"
	const WALK_C = "Walking_C"
	const WALK_BACK = "Walking_Backwards"
	const RUN_A = "Running_A"
	const RUN_B = "Running_B"
	# ATTACKING
	const ATTACK_1H_CHOP = "1H_Melee_Attack_Chop"
	const ATTACK_1H_DIAGONAL = "1H_Melee_Attack_Slice_Diagonal"
	const ATTACK_1H_HORIZONTAL = "1H_Melee_Attack_Slice_Horizontal"
	const ATTACK_1H_STAB = "1H_Melee_Attack_Stab"
