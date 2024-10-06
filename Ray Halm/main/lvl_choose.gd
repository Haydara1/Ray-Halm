extends Node2D

func _on_button_pressed(level):
	get_parent().call("SelectLvl", level)
