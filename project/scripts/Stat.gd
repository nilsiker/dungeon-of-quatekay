extends Node
class_name Stat

signal updated(new_value: int)
signal taxed
signal restored
signal depleted

@export var stat: StatResource

func restore(amount: float):
    stat.value = min(stat.max_value, stat.value + amount)
    restored.emit()
    updated.emit(stat.value)

func tax(amount: float):
    stat.value = max(0, stat.value - amount)
    taxed.emit()
    updated.emit(stat.value)
    if stat.value == 0:
        depleted.emit()