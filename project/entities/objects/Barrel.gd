extends StaticBody3D


func damage(_amount: float):
	$HitParticles.emitting = true
	$HitAudio.play()
	$Visuals/Rustle.rustle()
	print("damaged")

