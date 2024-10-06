extends CanvasLayer

@export var lvl = 0
@export var number_of_pictures = 1

var middle_position = Vector2()

var polaroid_photo_sprite = preload("res://assets/krita/papers/photo.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	middle_position.x = get_viewport().size.x / 2
	middle_position.y = get_viewport().size.y / 2
	
	var polaroid_photo = Sprite2D.new()
	polaroid_photo.texture = polaroid_photo_sprite
	polaroid_photo.scale = polaroid_photo.scale / 3.5
	polaroid_photo.position = middle_position
	polaroid_photo.centered = true
	
	add_child(polaroid_photo)
	
	$Report_paper/Title.text = ""
	$Report_paper/Text.text = load_text(lvl)

func load_text(level):
	var file = FileAccess.open("res://main/reports/{lvl}.txt".format({"lvl":level}),FileAccess.READ)
	var text = file.get_as_text()
	
	file.close()
	return text
