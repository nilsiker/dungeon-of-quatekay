extends StaticBody3D

@export var _health: Stat

var barrel_hit_sounds: AudioStream = preload("res://entities/objects/stream_barrel_hit.tres")

func _ready() -> void:
	_health.taxed.connect(_on_health_taxed)
	_health.depleted.connect(_on_health_depleted)
	$DestroyedParticles.finished.connect(queue_free)



func damage(amount: int):
	if _health.stat.value > 0:
		_health.tax(amount)
	
func _on_health_taxed():
	AudioChannel.request_stream_at_position(barrel_hit_sounds, global_position)
	$HitParticles.restart()
	$Visuals/Rustle.rustle()


func _on_health_depleted():
	$DestroyedParticles.restart()
	$Visuals.hide()
