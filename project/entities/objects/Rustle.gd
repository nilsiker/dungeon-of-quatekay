extends Node

@export var _intensity: float = 1.0
@export var _duration: float = 1.0


var _tween: Tween
func rustle():
    if _tween: _tween.kill()
    _tween = create_tween()

    var x = _intensity * randi_range(-1, 1)
    var y = _intensity * randi_range(-1, 1)

    _tween.tween_property(get_parent(), "rotation:x", x ,_duration).set_trans(Tween.TRANS_BOUNCE)
    _tween.parallel().tween_property(get_parent(), "rotation:z", y ,_duration).set_trans(Tween.TRANS_BOUNCE)
    
    _tween.tween_property(get_parent(), "rotation:x", -x ,_duration).set_trans(Tween.TRANS_BOUNCE)
    _tween.parallel().tween_property(get_parent(), "rotation:z", -y ,_duration).set_trans(Tween.TRANS_BOUNCE)

    _tween.tween_property(get_parent(), "rotation:x", 0.0 ,_duration).set_trans(Tween.TRANS_BOUNCE)
    _tween.parallel().tween_property(get_parent(), "rotation:z", 0.0 ,_duration).set_trans(Tween.TRANS_BOUNCE)
    
