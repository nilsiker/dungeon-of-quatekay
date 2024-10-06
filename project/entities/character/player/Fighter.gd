extends Area3D
class_name Fighter

func hit():
	print("hitting")
	for body in get_overlapping_bodies():
		if body.has_method("damage"):
			body.damage(1)

