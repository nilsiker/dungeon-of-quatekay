extends Node

@export var _intensity: float = 1.0
@export var _duration: float = 1.0


var _tween: Tween
func rustle():
    if _tween: _tween.kill()
    _tween = create_tween()

    var x = _intensity * (1.0 if randi_range(-1, 1) > 0 else -1.0)
    var y = _intensity * (1.0 if randi_range(-1, 1) > 0 else -1.0)
    print(x)
    print(y)

    _tween.tween_property(get_parent(), "rotation_degrees:x", x ,_duration)
    _tween.parallel().tween_property(get_parent(), "rotation_degrees:z", y ,_duration)
    
    _tween.tween_property(get_parent(), "rotation_degrees:x", -x ,_duration)
    _tween.parallel().tween_property(get_parent(), "rotation_degrees:z", -y ,_duration)

    _tween.tween_property(get_parent(), "rotation_degrees:x", 0.0 ,_duration)
    _tween.parallel().tween_property(get_parent(), "rotation_degrees:z", 0.0 ,_duration)
    
