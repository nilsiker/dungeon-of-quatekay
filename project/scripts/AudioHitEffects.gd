extends Node

var pool: Array[AudioStreamPlayer3D] = []

func _ready() -> void:
    AudioChannel.stream_requested_at_position.connect(_on_stream_requested_at_position)


    for player: AudioStreamPlayer3D in get_children():
        player.finished.connect(func(): pool.push_back(player))
        pool.push_back(player)
    

func play_at_position(stream: AudioStream, position: Vector3):
    var player = pool.pop_back()
    if not player: 
        push_warning("hit effects audio pool ran out!")
        return

    player.stream = stream
    player.global_position = position
    player.play()


func _on_stream_requested_at_position(stream: AudioStream, position: Vector3):
    play_at_position(stream, position)