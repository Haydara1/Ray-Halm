extends AnimationPlayer

@export var label_text = ""
@export var picture1 : Texture
@export var picture2 : Texture
@export var picture3 : Texture

var office = preload("res://main/levels/office.tscn")

func _ready():
	$Label.text = label_text
	$photo1.texture = picture1
	$photo2.texture = picture2
	$photo3.texture = picture3
	
	$".".play("animation")
	
	await($".".animation_finished)
	self.queue_free()

func add_office():
	get_parent().add_child(office.instantiate())
