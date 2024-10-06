extends Node2D

func _on_introduction_animation_animation_finished(_animation):
	await(get_tree().create_timer(5).timeout)
	Dialogic.start("0_1")
	
