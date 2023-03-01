extends Control

#@onready var color_rect: ColorRect = %ColorRect
@onready var anim_: AnimationPlayer = %anim
# Declare a variable to store a reference to the ColorRect node
var color_rect
var transition
# Called when the node enters the scene tree for the first time.
func _ready():
	# Use get_node to retrieve a reference to the ColorRect node
	color_rect = get_node("ColorRect")
	color_rect.visible = true
	anim_.play("fade_in")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
