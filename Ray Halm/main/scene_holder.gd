extends Control

#variables
@onready var animationPlayer = $AnimationPlayer

#scenes
var start_menu = preload("res://main/start.tscn")
var lvl_select = preload("res://main/lvl_choose.tscn")

var greyscale = preload("res://main/temps/black_and_white.gdshader")

func _ready():
	set_process_input(false)
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _input(event):
	# opening the inventory
	if event.is_action_pressed("Inventory"):
		$Inventory.visible = !$Inventory.visible
		#turning the background into greyscale
		if $Inventory.visible == true:
			get_child(-1).material.shader = greyscale
		else: 
			get_child(-1).material.shader = null

func _on_dialogic_signal(argument:String):
	if argument == "dialog_started":
		set_process_input(false)
	if argument == "dialog_finished":
		set_process_input(true)

func _on_start_menu_start():
	animationPlayer.play("fade_in")
	await(animationPlayer.animation_finished)
	
	get_child(0).queue_free()
	add_child(lvl_select.instantiate())
	
	animationPlayer.play("fade_out")

func SelectLvl(level):
	animationPlayer.play("fade_in")
	await(animationPlayer.animation_finished)
	
	get_child(get_child_count() - 1).queue_free()
	add_child(load("res://main/levels/%s.tscn"%level).instantiate())
	
	animationPlayer.play("fade_out")
