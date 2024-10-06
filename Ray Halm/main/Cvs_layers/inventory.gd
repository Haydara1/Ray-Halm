extends CanvasLayer

#Containers

@onready var reports = $folder/reports
@onready var fax = $folder/fax
@onready var them = $folder/them

func _on_reports_button_pressed():
	reports.visible = true
	fax.visible = false
	them.visible = false


func _on_fax_button_pressed():
	reports.visible = false
	fax.visible = true
	them.visible = false


func _on_them_button_pressed():
	reports.visible = false
	fax.visible = false
	them.visible = true
