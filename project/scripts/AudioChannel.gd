extends Node

signal stream_requested_at_position(stream: AudioStream, position:Vector3)

func request_stream_at_position(stream: AudioStream, position: Vector3):
    print(stream, position)
    stream_requested_at_position.emit(stream, position)