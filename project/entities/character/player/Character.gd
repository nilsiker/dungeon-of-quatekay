@tool
extends Node3D
class_name Character

signal anim_finished(anim_name: String)
signal anim_footstep
signal hit

enum Type {
	BARBARIAN,
	KNIGHT,
	MAGE,
	ROGUE
}

@export var type: Type:
	get: return type
	set(value):
		type = value
		for i in range(0, get_children().size()):
			var node = get_child(i)
			if i == value:
				_set_active(node)
			else:
				node.visible = false
@export var _active_character: KayKitCharacter


func _set_active(node: Node3D):
	if _active_character:
		_active_character.visible = false
	_active_character = node
	_active_character.visible = true

func play(animation_name: String):
	_active_character.play(animation_name)

func face(dir: Vector3):
	var target_transform = global_transform.looking_at(global_position + dir, Vector3.UP, true)
	global_transform = global_transform.interpolate_with(target_transform, 0.25)


func _on_anim_finished(animation_name: String) -> void:
	anim_finished.emit(animation_name)


func _on_anim_footstep() -> void:
	anim_footstep.emit()

func _on_anim_hit() -> void:
	hit.emit()