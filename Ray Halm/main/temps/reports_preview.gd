extends Sprite2D

@export var label_text = ""
@export var preview_photo : Texture
@export var level = 0

@onready var label = $Label
@onready var image = $Image

func _ready():
	image.texture = preview_photo
	label.text = label_text
	
	self.rotation = randf_range(-PI/20, PI/20)


func _on_button_pressed():
	pass
