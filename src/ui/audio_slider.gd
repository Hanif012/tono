extends HBoxContainer


# Called when the node enters the scene tree for the first time.
@onready var slider := $music_slider as Slider

# The slider's default value.
# Used to reset the slider to its default value when right-clicked
@onready var default := slider.value



func _on_music_slider_gui_input(event: InputEvent) -> void:
	if (
		event is InputEventMouseButton and
		(event as InputEventMouseButton).button_index == MOUSE_BUTTON_RIGHT
	):
		slider.value = default

func _process(delta):
	print(default)


func _on_slider_value_changed(value):
	slider.value = value
	print(value)


