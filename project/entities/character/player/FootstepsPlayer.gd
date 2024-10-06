extends AudioStreamPlayer3D

@export var _stream: AudioStream
@onready var _ray: RayCast3D = $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var collider = _ray.get_collider()
	if collider is GridMap:
		var map = collider as GridMap		


		
	


func _on_character_anim_footstep() -> void:
	play()
